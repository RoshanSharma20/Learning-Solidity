// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MyHotelRoom {
    enum statuses {
        vacant,
        occupied
    } //using enum statuses is defined which has two values vacant and occupied
    statuses public currentStatus; //currentStatus is defined as statuses type
    address payable public owner; //address of owner who will deploy the contract to the blockchain
    event Occupy(address _occupant, uint256 _value); //event to alert the following contents

    constructor() {
        owner = payable(msg.sender); //msg.sender must be made payable as implicitly it cannot be made payable even if it was defined earlier
        currentStatus = statuses.vacant;
    }

    modifier onlyVacant() {
        //modifier
        require(currentStatus == statuses.vacant, "currently occupied"); //check if room is vacant or not
        _;
    }

    modifier payAmount() {
        //modifier
        require(msg.value >= 2 ether, "insufficient value"); //check if sufficient amount of money is being paid to book the room
        _;
    }

    modifier onlyNotVacant() {
        //modifier
        require(currentStatus == statuses.occupied, "room was never booked"); //check if room was occupied or not
        _;
    }

    function Book() public payable onlyVacant payAmount {
        currentStatus = statuses.occupied;
        (bool sent, ) = owner.call{value: msg.value}(""); //caal function to send the money to owner to book the room and if success then sent is stored as true
        require(sent);
        emit Occupy(msg.sender, msg.value);
    }

    function checkOut() public onlyNotVacant {
        currentStatus = statuses.vacant;
    }
}
