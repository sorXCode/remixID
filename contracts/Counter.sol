 // SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Counter {
    uint8 public counter;

    function inc() public returns (uint) {
        counter += 1;
        return counter;
    }

    function dec() public returns (uint) {
        counter -= 1;
        return counter;
    }
}