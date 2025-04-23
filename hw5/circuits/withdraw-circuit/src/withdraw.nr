// circuits/withdraw-circuit/src/withdraw.nr
fn main(
    // Private inputs
    r: Field,
    index: Field,
    path: [Field; 8],

    // Public inputs
    root: pub Field,
    id: pub Field,

) {
    // Assert commitment is in the tree at index
    assert(root == std::merkle::compute_merkle_root(std::hash::pedersen_hash([id, r]), index, path));

}
