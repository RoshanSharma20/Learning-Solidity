// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

//creating a simple real life Piggy Bank model smart contract
contract PiggyBank {
    address public owner;

    event deposit(uint256 value);
    event draw(uint256 value);

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {
        emit deposit(msg.value);
    } //we assume that transaction is being made in which the data component is empty

    modifier onlyOwner() {
        require(msg.sender == owner, "not the owner");
        _;
    }

    function withdraw() public payable onlyOwner {
        emit draw(address(this).balance);
        selfdestruct(payable(msg.sender)); //the address of the sender is the address where the value contained by the contract will be stored on being deleted
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
