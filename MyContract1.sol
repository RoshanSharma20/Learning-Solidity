// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MyContract1 {
    //arrays
    uint256[] public myArray = [1, 2, 3];
    string[] public values = ["apple", "banana", "guava"];
    //2d arrays
    uint256[][] public array2d = [[1, 2, 3], [4, 5, 6]];

    function addValue(string memory _value) public {
        values.push(_value);
    }
    //to get length
    //myArray.length;
}
