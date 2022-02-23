// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SimpleStorage {
    
    // this will get initialized as 0
    uint256 favoriteNumber;
    bool favoriteBool;

    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    Person[] people;
    mapping(string => uint256) public nameToFavoriteNumber;
    
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    // view, pure
    function retrieveFavoriteNumber() public view returns(uint256) {
        return favoriteNumber;
    }

    function addToPeople(string memory _name, uint _favoriteNumber) public {
        Person memory _person = Person({name: _name, favoriteNumber: _favoriteNumber});
        people.push(_person);
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

}