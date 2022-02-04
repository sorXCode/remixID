// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.6;


contract Bank {
    /* Features: 
        - Deposit => user can pay into their account
        - withdraw => user can withdraw from their account
        - get_users_balance => user can view their account balance
        - get_bank_balance => the contract owner can view the total amount in the bank 
        - transfer => user can transfer funds to another account
        ------------------------------------------------------------------------------------------
        improvements:
        - use fallback/receive method
        - separate contracts: one for bank, and the other for user
        - apply DRY(Don't Repeat Yourself) to withdraw and transfer_to_address functions
        - check against 0x0000000000000000000000000000000000000000 address for transactions
    */
    // deployedA: 0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8
    event SendWithdrawalReciept(bytes data);
    event SendTransferReciept(bytes data);

    mapping(address=>uint) balances;
    address immutable owner;
    uint private bank_balance;

    modifier onlyOwner(){
        require(msg.sender==owner, "Access denied");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function deposit() public payable {
        // TODO: ensure deposited amout is greater than 0
        // test: deposit negative amount
        balances[msg.sender] = balances[msg.sender] + msg.value;
        bank_balance += msg.value;
    }

    function get_user_balance() public view returns(uint){
        return balances[msg.sender];
    }

    // withdrawer's address, amount, 
    function withdraw(uint _amount) public {
        // TODO: ensure amount is greater than 0
        require(balances[msg.sender] >= _amount, "Insufficient Funds");
        balances[msg.sender] -= _amount;
        bank_balance -= _amount;

        (bool sent, bytes memory data) = msg.sender.call{value: _amount}("");
        require(sent, "Withdrawal failed");
        emit SendWithdrawalReciept(data);
    }

    function get_bank_balance() public view onlyOwner returns(uint) {
        return bank_balance;
    }

    function transfer_to_address(address _to, uint _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient Funds");
        balances[msg.sender] -= _amount;
        bank_balance -= _amount;

        (bool sent, bytes memory data) = _to.call{value: _amount}("");
        require(sent, "Transfer failed");
        emit SendTransferReciept(data);

    }
}