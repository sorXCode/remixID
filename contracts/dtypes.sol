// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract DataTypes {

//   int[] array = [1, 2, 3, 4];
//   "abcd"

  function add(uint x, uint y ) public pure returns(uint) {
      uint z = x+y ;
      return z;
  }

// TODO: check this out!
//   function callNumber(string calldata x) external {
//       x;
//   }

  function add_(int x, int y) public {
      int z = x+y ;
  }

}

/*
string===bytes===bytes1[]===array===reference type

bytes
2**8=>256 possible value

valid range: bytes1 to bytes32

bytes => bytes1[]

*/


// bytes32 => 2^(8) *32

// possible values for bytes type:
// 1bit .......   -----
// 4bit ......... 1 character
// 8bits ........ 2characters
 