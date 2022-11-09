// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

//3 ways to send ethereum to contracts in solidity
contract SendEth {
    //first the contracts needs to be made payable to accept payments
    //2 ways to do it
    constructor() payable {} //make the constructor payable

    receive() external payable {} //either include a fallback or receive function

    function sendViaTransfer(address payable _to) public payable {
        //sends 2300 gas,if function fails then it doesn't even return any boolean value to know if transaction was successful or not
        _to.transfer(123);
    }

    function sendViaSend(address payable _to) public payable {
        //similar to transfer,it returns a boolean value to know the status of the transaction
        bool success = _to.send(123);
        require(success, "transaction failed");
    }

    function sendViaCall(address payable _to) public payable {
        //forwards all the gas,returns a boolean value and transfers back all the remaining gas that was unused
        (bool success, ) = _to.call{value: 123}("");
        require(success, "transaction failed");
    }
}

contract EthReceiver {
    event Log(uint256 value, uint256 gas);

    receive() external payable {
        emit Log(msg.value, gasleft());
    }
}
