// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

contract FunctionOutputs {
    function returnMany() public pure returns (uint256, bool) {
        return (1, true);
    }

    function NamedOutput() public pure returns (uint256 x, bool b) {
        return (1, true);
    }

    function NamedOutputTrial() public pure returns (uint256 x, bool b) {
        x = 1;
        b = true;
    }

    function destructuringAssignments() public pure returns (uint256, bool) {
        (uint256 _x, bool _b) = NamedOutput(); //outputs from the fuctions are stored in variables _x & _b
        return (_x, _b);
    }
}
