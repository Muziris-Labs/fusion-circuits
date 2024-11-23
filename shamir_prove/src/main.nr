use dep::std::hash::poseidon2;

struct Share {
    x: Field,
    y: [Field; 32]
}

pub fn main(
    shares: [Share; 2],
    message: pub [u8; 32], // The message encoded to verify the transaction, used as flag
    hash: pub Field,
    verifyingAddress: pub Field, // The address of the EOA that signed the message through trusted forwarder, used as flag
    signingAddress: pub Field // The address of the EOA that executed the transaction, used as flag
) {
    let mut secret: [Field; 32] = [0; 32];

    // Reconstruct each secret value independently
    for i in 0..32 {
        // Lagrange interpolation for each secret value (simplified for 2 points)
        let mut term0 = shares[0].y[i];
        term0 = term0 * (-shares[1].x);
        term0 = term0 / (shares[0].x - shares[1].x);

        let mut term1 = shares[1].y[i];
        term1 = term1 * (-shares[0].x);
        term1 = term1 / (shares[1].x - shares[0].x);

        secret[i] = term0 + term1;
    }

    let expectedHash = poseidon2::Poseidon2::hash(secret, 32);
    assert(hash == expectedHash, "Hash mismatch");
}
