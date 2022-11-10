// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

//to create contracts from other contracts
contract Accounts
{
    address public bank;
    address public owner;
    
    constructor (address _owner) payable
    {
        bank = msg.sender;//the contract that called the function to create the contract becomes the bank of Account contract
        owner = _owner;//while the owner of the contract is passed as parameter in the calling function
    }
}

contract AccountFactory{
    Accounts[] public accounts;
    function createContract(address _owner)public payable{
        Accounts account = new Accounts{value:111}(_owner);//some ether needs to be sent as the AccountsFactory itself doesn't have any ether stored
        accounts.push(account);
    }
}