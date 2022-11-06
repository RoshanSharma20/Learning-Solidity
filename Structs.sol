// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

//Structures in Solidity
contract Structs {
    //syntax to declare structs
    struct Car {
        string model;
        int256 year;
        address owner;
    }
    //to declare an object of struct Car
    Car public car; //initializes the object with default values
    Car[] public carArray; //array for struct Car type

    function assignValues() public {
        //3 ways to initialize structs
        Car memory toyota = Car("toyot", 1990, msg.sender); //passing the parameters according to their order in the structure
        Car memory lambo = Car({
            model: "lamborghini",
            year: 1999,
            owner: msg.sender
        }); //using a key-value pair also here the order of the attributes can be changed
        Car memory volks; //declaring the object of the struct with default values
        volks.model = "volksWagen"; //later assigning the values using the dot operator
        volks.year = 1980;
        volks.owner = msg.sender;

        //since the objects are created in memory to make it availabel after the function execution,push it into the array
        carArray.push(toyota);
        carArray.push(lambo);
        carArray.push(volks);

        //to access the values of an object
        // Car memory _car = carArray[0];//since the type is memory,the values can only be accessed but not changed
        // string memory name = _car.model;
        Car storage _car1 = carArray[1];
        _car1.model = "bmw";
        delete _car1.owner; //sets to default value

        delete carArray[0]; //to set all the attributes to default values of the first element in the array
    }
}
