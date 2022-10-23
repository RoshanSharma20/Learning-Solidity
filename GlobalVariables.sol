// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

contract GlobalVariable {
    function callGlobals()
        public
        view
        returns (
            address,
            uint256,
            uint256
        )
    {
        address sender = msg.sender;
        uint256 time = block.timestamp;
        uint256 num = block.number;
        return (sender, time, num);
    }
}
