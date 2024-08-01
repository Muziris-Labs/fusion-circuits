use dep::std::hash::poseidon2;

/**
* @notice Poseidon2 Hash used in most of the current circuit with 2 inputs
*/
fn main(inputs: [Field; 2]) -> pub Field {
    let hash = poseidon2::Poseidon2::hash(inputs, 2);

    hash
}
