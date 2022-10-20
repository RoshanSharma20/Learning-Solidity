// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MyContract2 {
    mapping(uint256 => string) public names;
    struct books {
        string title;
        string author;
    }
    mapping(uint256 => books) public Books;
    mapping(address => mapping(uint256 => books)) public MyBooks; //nested mapping

    constructor() {
        names[1] = "Bruce";
        names[2] = "Wayne";
        names[3] = "BatMan";
    }

    function addBooks(
        uint256 _values,
        string memory _title,
        string memory _author
    ) public {
        Books[_values] = books(_title, _author);
    }

    function addMyBooks(
        uint256 _values,
        string memory _title,
        string memory _author
    ) public {
        MyBooks[msg.sender][_values] = books(_title, _author);
    }
}
