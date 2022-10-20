// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Counter {
    //contract keyword to declare the ethereum contract being written
    //count is a state variable here as it is stored in the block
    uint256 count; //after refactoring -> uint256 public count=0;

    constructor() {
        //public visibility is not required to be specified after refactoring it is removed as we have make count as public and initialize it to zero
        count = 0;
    }

    //after refactoring getCount is removed
    function getCount() public view returns (uint256) {
        return count;
    }

    //incrementCount increases the value of count by 1
    function incrementCount() public {
        count = count + 1;
    }
}
