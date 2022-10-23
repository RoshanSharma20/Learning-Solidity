// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

contract pure_and_view {
    uint256 public num = 5;

    function viewNum()
        public
        view
        returns (
            uint256 //since the state variable is only being read it is a view type function
        )
    {
        return num;
    }

    function viewLocal()
        public
        pure
        returns (
            uint256 //no state variable is being accessed therefore it a pure type function
        )
    {
        return 1;
    }

    function viewBoth() public view returns (uint256) {
        return num + 5;
    }

    function viewChange()
        public
    //the state variable is being altered here so it is neither pure nor view
    {
        num = num + 20;
    }
}
