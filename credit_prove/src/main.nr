use dep::std::hash::poseidon2;

/**
* @notice Main function that verifies the passcode and hashes the passcode and the chainId
*/
fn main(
    reqDomain: Field,
    passcode: Field,
    serverHash: pub Field,
    domain: pub Field,
    chainId: pub Field,
    txHash: pub [u8; 32], // The transaction hash that is being verified, used as flag
    amount: pub Field, // The amount that is being verified, used as flag
    tx_type: pub u8, // The transaction type that is being verified, used as flag
    // 0 = credit, 1 = debit
    signing_address: pub Field// The address that signed the message, used as flag
) {
    let hash = poseidon2::Poseidon2::hash([passcode, chainId], 2);

    assert(hash == serverHash);
    assert(domain == reqDomain);
}
