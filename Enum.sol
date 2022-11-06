// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

//Enum in Solidity
contract Enum {
    //enum helps to express multiple values/states of a variable
    enum Status {
        none,
        packaged,
        shipped,
        completed,
        rejected,
        cancelled
    }

    //declaring a variable of enum type
    Status public status; //it is set to default value of first value

    //function to get the status of enum variable
    function get() public view returns (Status) {
        return status;
    }

    //function to set status value
    function set(Status _status) public {
        status = _status;
    }

    //set status to shipped
    function ship() public {
        status = Status.shipped; //status to set enum Status's shipped value
    }
    //delete can be used to set the status to default value
}
