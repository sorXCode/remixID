 // SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

import "hardhat/console.sol";

contract StorageSample {
    string public value;

    function setValue(string memory _value) public {
        value = _value;
    }
}

error Overflow(string msg);

contract UintOverflow {
    uint8 public value = 254;


    function increase() public payable {
        revert Overflow({msg:"Val larger than expected"});
    }
    function reset() public {
        value = 255;
    }
}