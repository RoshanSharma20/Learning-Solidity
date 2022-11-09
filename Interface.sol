// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

//Interface concept in solidity
interface Icounter {
    //interface declared for Counter contract,which is already deployed on the chain
    function incrementCount() external; //functions which are required in the interface are specified

    function getCount() external view returns (uint256);
}

contract Interface {
    uint256 public count;

    function example(address _counter)
        public
        returns (
            uint256 //address of the deployed Counter contract is passed to be used by another contract
        )
    {
        Icounter(_counter).incrementCount();
        count = Icounter(_counter).getCount();
        return count;
    }
}
