// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

//Data Locations in Solidity-memory,storage and calldata
//memory is used to store data in memory and once the fuction execution is over,the memory is cleared
//storage is like state variable,memory persists even after function execution
//calldata is similar to memory,it is used to pass parameters in function calls within another function and can potentially save gas
contract DataLocations {
    struct MyStruct {
        int256 num;
        string text;
    }
    mapping(address => MyStruct) public myStruct;

    function example(uint256[] calldata _x, string memory s)
        public
        returns (uint256[] memory)
    {
        myStruct[msg.sender] = MyStruct(123, "foo");
        MyStruct memory readOnly = myStruct[msg.sender]; //the data can only be read,changes made only remains until the function execution is completed
        readOnly.text = s;

        MyStruct storage changeAllowed = myStruct[msg.sender];
        changeAllowed.text = s; //using storage changes can be made to attributes of the object which remains even after function execution

        internally(_x);

        //declaring a memory array(needs to be of fixes size,dynamic array is not allowed)
        uint256[] memory Arr = new uint256[](3);
        Arr[0] = 5;
        return Arr;
    }

    function internally(uint256[] calldata _x) private pure {
        uint256 x = _x[0];
        x = x + 1;
    }
}
