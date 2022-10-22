// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Ownable {
    address owner;
    modifier isOwner() {
        require(msg.sender == owner, "only owner is authorized"); //to check if the fucntion getSecretString is being called by the owner of the contract
        _;
    }

    constructor() {
        owner = msg.sender;
    }
}

contract SecretVault {
    //contract to store the secret message
    string secret;

    constructor(string memory _secret) {
        secret = _secret;
    }

    function getSecret() public view returns (string memory) {
        return secret;
    }
}

contract MyContract is Ownable {
    address Secretvault; //to store address of local object of contract SecretVault that is created in the constructor for further use

    constructor(string memory _secret) {
        SecretVault secretVault = new SecretVault(_secret);
        Secretvault = address(secretVault);
        super; //to call constructor of Ownable contract using super keyword
    }

    function getSecretString() public view isOwner returns (string memory) {
        return SecretVault(Secretvault).getSecret(); //to interact with any contract we need to have the address of the contract object that can be refernced
    }
}
