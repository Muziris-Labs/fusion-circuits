use std::hash::poseidon2;

/**
* @notice Poseidon2 Hash used in most of the current circuit with 65 inputs
*/
fn main(inputs: [Field; 65]) -> pub Field {
    let hash = poseidon2::Poseidon2::hash(inputs, 65);

    hash
}
