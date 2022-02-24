const { MerkleTree } = require('merkletreejs')
const SHA256 = require('crypto-js/sha256')

function generateMerkleTree(data){

    const leaves = data.map(x => SHA256(x))
    const tree = new MerkleTree(leaves, SHA256)
    const root = tree.getRoot().toString('hex')
    return {tree, root}
}

const data = ["Hello", "sasas", "ewss"]
const {tree}= generateMerkleTree(data)

console.log(tree.toString())
