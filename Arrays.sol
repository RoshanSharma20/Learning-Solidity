// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

contract Arrays {
    uint256[] public nums = [1, 2, 3];

    function returnArray()
        public
        view
        returns (
            uint256[] memory //fucntion to view the array
        )
    {
        return nums;
    }

    // function returnarray(uint[] memory number)public pure returns(uint[] memory)
    // {
    //     return number;
    // }
    function examples() public pure returns (uint256[] memory) {
        // create array in memory, only fixed size can be created
        uint256[] memory a = new uint256[](5); //must be created inside a function
        //default value is assigned as 0
        a[1] = 123;
        return a;
    }
}
