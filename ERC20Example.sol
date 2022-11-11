// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

//sample smart contract for ERC20 token
import "./ERC20Interface.sol";//error unresolved 

contract ERC20Example{
    uint public totalSupply=0;
    event  Transfer(address indexed sender,address indexed recipient,uint amount);//emit the event of transfering amount
    event Approval(address indexed from,address indexed to,uint amount);//emit the event of granting the approval  
    mapping(address => uint)public balanceOf;
    mapping(address =>mapping(address => uint))public allowance;
    string public name = "Test";
    string public symbol = "TEST";
    uint8 public decimal = 18;

    function transfer(address recipient,uint amount)external returns(bool)
    {
        balanceOf[msg.sender]-=amount;
        balanceOf[recipient]+=amount;
        emit Transfer(msg.sender,recipient,amount);
        return true;
    }

    function approve(address recipient,uint amount)external returns(bool)
    {
        allowance[msg.sender][recipient]=amount;
        emit Approval(msg.sender, recipient, amount);
        return true;
    }
    
    function transferFrom(address sender,address recipient,uint amount)external returns(bool)
    {
        allowance[sender][msg.sender]-=amount;
        balanceOf[sender]-=amount;
        balanceOf[recipient]+=amount;
        emit Transfer(sender,recipient,amount);
        return true;
    }

    function mint(uint amount)external returns(bool)
    {
        balanceOf[msg.sender]+=amount;
        totalSupply+=amount;
        emit Transfer(address(0), msg.sender, amount);
        return true;
    }

    function burn(uint amount)external returns(bool)
    {
        balanceOf[msg.sender]-=amount;
        emit Transfer(msg.sender, address(0), amount);
        return true;
    }
}