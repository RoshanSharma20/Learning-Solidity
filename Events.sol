// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

//Events in Solidity are used to store details in blockchain but are required to be consumed using the front-end interface
contract Events {
    event Log(string message, uint256 value); //declaring an event

    function emitMessage(string memory _message, uint256 _val) public {
        emit Log(_message, _val);
    }

    event Message(address indexed _from, address indexed _to, uint256 value); //indexed helps to search and access information faster

    function emitIndexed(address to, uint256 _value) public {
        emit Message(msg.sender, to, _value); //logging an event
    }
}
