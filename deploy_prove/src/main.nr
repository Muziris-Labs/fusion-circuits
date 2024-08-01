use dep::std::hash::poseidon2;

/**
* @notice Hashing the passcode and chainId and checking if it matches the serverHash
*/
fn main(
    reqDomain: Field,
    passcode: Field,
    serverHash: pub Field,
    domain: pub Field,
    chainId: pub Field,
    signing_address: Field,
    proving_address: pub Field
) {
    let hash = poseidon2::Poseidon2::hash([passcode, chainId], 2);

    assert(hash == serverHash);
    assert(domain == reqDomain);
    assert(signing_address == proving_address);
}
