// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Hard {
    struct Person {
        uint8 age;
        uint8 height;
        string name;
    }

    event Alert(uint indexed index, Person person);
    mapping(uint => Person) private people;

    function addPerson(uint _i, Person memory _person) public {
        people[_i] = _person;
        emit Alert(_i, _person);
    }

    function viewPerson(uint _i) public view returns(Person memory _person){
        return people[_i];
    }

}