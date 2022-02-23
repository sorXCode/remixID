// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./SimpleStorage.sol";




/*

    struct King {
        uint crowns;
    }
    enum Status {
        submitted,
        rejected,
        approved
    }

    mapping(bytes => int) x;
    mapping(King => int) dsdx;
    mapping(Status => int) dsdx;

*/

contract StorageFactory {

    // create an array of SimpleStorage
    SimpleStorage[] simpleStorages;

    function createSimpleStorage() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorages.push(simpleStorage);
    }

    function sfStore(uint256 _index, uint256 _favoriteNumber) public {
        // Address
        // ABI
        SimpleStorage _simpleStorage = simpleStorages[_index];
        _simpleStorage.store(_favoriteNumber);


        simpleStorages[_index]
        .store(_favoriteNumber);

    }

    function sfGet(uint256 _index) public view returns (uint256) {
        return simpleStorages[_index].retrieveFavoriteNumber();
    }
}

["0x618e104D81669c9ab0082a4e934abD5c3e9c2473",
"0xbf2506980854b6676bc03Fff61eA37e16F590cA5",
"0x775B9feFf325f057ddf796dc582f0ca3c2D9aAA2",
"0xAE76c561daeDD9f06122ED9a16C39B32E35acA69",
"0x84F1eA9fb2bFd2082De925245846D547cD8Bb00E",
"0x869C831dFBBFd8a23bb7e78B64E459a8bcE22D40",
"0xF88EDA0af349C50A469F7F43Fb15cF8831F7a081",
"0xc6b336BE77D9A30776f044375A96224303d07F03",
"0xBebf4f6A18e74329C4c69673A284AFa30333643a"]