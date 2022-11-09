// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

//payable keyword in Solidity

contract Payable {
    address payable immutable public owner;//the address is now able to send ether as it is declared as payable

    constructor ()
    {
        owner = payable(msg.sender);//type casting is required to specify the address being assigned is also payable
    }

    function deposit() public payable {}//allows to send ethers to this contract

    function getBalance() public view returns (uint)
    {
        return address(this).balance;//to check the ether balance stored at this address 
    }
}