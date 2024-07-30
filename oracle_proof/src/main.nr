use std::hash::poseidon2;

/**
* @notice verify the Signature through the Oracle
* @dev returns A secret hash based on the public key  if the signature is valid
*/
#[oracle(serverVerify)]
unconstrained fn verify(
    pub_key_x: [Field; 32],
    pub_key_y: [Field; 32],
    signature: [u8; 64],
    hashed_message: [u8; 32]
) -> Field {}

/**
* @notice unconstrained function that encloses the oracle function
*/
unconstrained fn server_verify(
    pub_key_x: [Field; 32],
    pub_key_y: [Field; 32],
    signature: [u8; 64],
    hashed_message: [u8; 32]
) -> Field {
    verify(pub_key_x, pub_key_y, signature, hashed_message)
}

/**
* @notice main function that verifies the signature and hashes the public key and the result
* @dev check if the provided tx_hash is equal to the hash of the public key and the result
*/
fn main(
    pub_key_x: [Field; 32],
    pub_key_y: [Field; 32],
    signature: [u8; 64],
    hashed_message: pub [u8; 32],
    tx_hash: pub Field,
    verifying_address: Field, // The address that is being verified, used as flag
    signing_address: pub Field // The address that signed the message, used as flag
) {
    let result = server_verify(pub_key_x, pub_key_y, signature, hashed_message);

    let mut combined = [0; 65];

    for i in 0..65 {
        if i < 32 {
            combined[i] = pub_key_x[i];
        } else if i < 64 {
            combined[i] = pub_key_y[i - 32];
        } else {
            combined[i] = result;
        }
    }

    let hash = poseidon2::Poseidon2::hash(combined, 65);

    assert(hash == tx_hash);

    println(verifying_address); // Used as flag to verify with the contract
    println(signing_address); // Used as flag to verify with the contract
}
