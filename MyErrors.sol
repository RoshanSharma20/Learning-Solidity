// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

contract Errors {
    uint256 public num = 123;

    function requireCheck(uint256 i) public pure returns (uint256) {
        require(i <= 10, "value passed is greater than 10");
        return i + 5;
    }

    function revertCheck(uint256 i) public pure returns (uint256) {
        i = i * 3;
        if (i > 10) {
            revert("value of i becomes greater than 10");
        }
        return i;
    }

    function assertCheck() public view {
        assert(num == 123);
    }

    function makeChange() public {
        num += 1;
    }

    error MyError(address sender, uint256 i);

    function customError(uint256 i) public view {
        if (i > 10) {
            revert MyError(msg.sender, i);
        }
    }
}
