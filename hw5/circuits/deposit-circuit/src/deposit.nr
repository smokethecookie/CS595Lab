// circuits/deposit-circuit/src/deposit.nr
fn main(
    // Private inputs
    id: Field, 
    r: Field,
    old_path: [Field; 8],

    // Public inputs
    old_root: pub Field,
    new_root: pub Field,
    commitment: pub Field,
    index: pub Field

) {
    // 1) Pedersen(id, r) == commitment
    assert(std::hash::pedersen_hash([id, r]) == commitment);
    

    // 2) old_root must match a tree of all-zero leaves at `index`
    let zero = 0x18d85f3de6dcd78b6ffbf5d8374433a5528d8e3bf2100df0b7bb43a4c59ebd63;

    assert(std::merkle::compute_merkle_root(zero, index, old_path) == old_root);

    // 3) new_root must match after inserting `commitment` at `index`
    assert(std::merkle::compute_merkle_root(commitment, index, old_path)== new_root);
}
