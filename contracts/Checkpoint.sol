 // SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Assignor {
    string public nickname;

    function assign(string memory _nickname) public returns (string memory){
        nickname = _nickname;
        return nickname;
    }
}