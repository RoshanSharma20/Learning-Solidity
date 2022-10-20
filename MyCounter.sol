// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MyContract {
    //state variables
    int8 public myInt8 = 1;
    int256 public myInt256 = 1;
    uint8 public myUnit8 = 1;
    uint256 public myUnit256 = 1;
    address public myAddress = 0x46a72055Deec2a8848763CC71ffa95e8034dD8c8;
    string public myString = "hello,everyone!";
    //struct
    struct myStruct {
        uint256 value;
        string myString;
    }

    myStruct public myStruct1 = myStruct(5, "hello world!");

    function getValue() public pure returns (uint256) {
        uint256 value = 1; //local variable
        return value;
    }
}
