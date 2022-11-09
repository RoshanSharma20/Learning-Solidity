// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

//Solidity code of a simple Ether Wallet

contract EtherWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint256 amount) public payable {
        require(msg.sender == owner, "caller is not owner");
        owner.transfer(amount);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
