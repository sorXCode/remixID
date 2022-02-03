// SPDX-License-Identifier: GPL-3.0
/// @title ENS CONTRACT FOR ens addresses purchase by users
/// @author sorxcode
/// @notice This is a practice script to simulate the ENS activities
/// @dev Kindly raise PR if you notice any bug or issue
pragma solidity >=0.7.0 <0.9.0;

contract ENS {
    enum ENS_CATEGORY {
        SHORT,
        MEDIUM,
        LONG
    }
    mapping(address => bytes) purchased_ens_addr_map;
    mapping(string => bool) purchased_ens;
    mapping(ENS_CATEGORY => uint64) private pricing;
    bytes constant EXTENSION = ".ens";
    address immutable owner;
    bool locked;

    modifier ENSAvailable(string memory _ens) {
        require(bytes(_ens).length > 0, "ENS too short");
        require(!isENSAvailable(_ens), "ENS is not available");
        _;
    }

    modifier noReentrant() {
        require(!locked, "No re entrant");
        locked = true;
        _;
        locked = false;
    }

    event ENSPurchaseSuccessful(string msg, string addr);

    error InsufficientBalance(address _addr, uint256 amount);

    constructor() {
        owner = msg.sender;

        pricing[ENS_CATEGORY.SHORT] = 5 gwei;
        pricing[ENS_CATEGORY.MEDIUM] = 3 gwei;
        pricing[ENS_CATEGORY.LONG] = 1 gwei;
    }

    function isENSAvailable(string memory _ens) public view returns (bool) {
        return !purchased_ens[_ens];
    }

    function getPrice(string memory _ens) public view returns (uint64 _price) {
        ENS_CATEGORY _category;
        uint64 _ens_len = uint64(bytes(_ens).length);

        if (_ens_len >= 5) {
            _category = ENS_CATEGORY.LONG;
        } else if (_ens_len >= 3) {
            _category = ENS_CATEGORY.MEDIUM;
        } else {
            _category = ENS_CATEGORY.SHORT;
        }

        _price = pricing[_category];
    }

    function purchaseENS(string memory _ens)
        external
        payable
        ENSAvailable(_ens)
        noReentrant()
    {
        // TODO: refund excess ether sent
        uint256 amt_sent_diff = msg.value - getPrice(_ens);
        require(amt_sent_diff >= 0, "amount sent too low");
        // return excess to user wallet at end of logic
        purchased_ens_addr_map[msg.sender] = bytes(_ens);
        purchased_ens[_ens] = true;
        emit ENSPurchaseSuccessful("Purchase successful", _ens);
    }
}
