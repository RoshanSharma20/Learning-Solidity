// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

//Library in Solidity
library Maxi {
    function maxima(uint256 x, uint256 y) internal pure returns (uint256) {
        return x >= y ? x : y;
    }
}

contract FindMax {
    function maximum(uint256 x, uint256 y) public pure returns (uint256) {
        return Maxi.maxima(x, y);
    }
}

library arrayMax {
    function maxi(uint256[] memory arr, uint256 x)
        internal
        pure
        returns (uint256)
    {
        for (uint256 i = 0; i < arr.length; ++i) {
            if (arr[i] == x) {
                return i;
            }
        }
        revert("not found");
    }
}

contract FindArrayMax {
    uint256[] public arr = [3, 2, 1];

    function findmaximum() public view returns (uint256) {
        return arrayMax.maxi(arr, 2);
    }
}
