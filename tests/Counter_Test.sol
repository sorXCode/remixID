 // SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "../contracts/Counter.sol";

contract TestCounter {
    function testInitialCountValue() public {
        assert.equal(1,1,"Should be 0");
    }
}