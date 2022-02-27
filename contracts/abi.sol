// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ABI {
    string symbol = "$";
    string balance = "1000";

    function exampleA() public view returns(bytes memory) {
        // use abi.encode to convert string to bytes
        bytes memory result = abi.encode(balance);
        return result;
    }

    function exampleB() public pure returns(bytes memory) {
        string memory firstName = "John";
        string memory lastName = "Doe";

        // use abi.encodePacked to convert many strings to single bytes
        bytes memory result = abi.encodePacked(firstName, " ", lastName, " has registered!");

        return result;
    }

    function add(uint256 _a, uint256 _b) public pure returns(uint256){
        return _a + _b;
    }

    // encodeWithSelector
    function exampleC() public pure returns(bytes memory) {
        bytes memory signature = "add(uint256,uint256)";
        bytes4 selector = bytes4(keccak256(signature));
        // use abi.encodeWithSelector to generate bytes that can actually trigger a function when 
        // called using low-level call.
        // Note: the function selector is need; you derive the function selector from the function signature
        bytes memory result = abi.encodeWithSelector(selector, 1,2);
        return result;
    }

    function exampleD() public pure returns(bytes memory) {
        string memory signature = "add(uint256,uint256)";
        // use abi.encodeWithSelector to generate bytes that can actually trigger a function when 
        // called using low-level call.
        // Note: Only the function signature is needed
        bytes memory result = abi.encodeWithSignature(signature, 1,2);
        return result;
    }

    function callEncoded(bytes memory _encoded) public returns(bytes memory){
        // you can call any contract function via low-level call;
        // ??applies to public and extrernal function??
        (bool status, bytes memory result) = address(this).call(_encoded);
        return result;
    }
}