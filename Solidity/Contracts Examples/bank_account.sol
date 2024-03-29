// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract PausableToken {

    address public owner;
    bool public paused;
    mapping (address => uint) balance;

    // use to initate the values btw it is called when the contract is deployed on blockchain 
    constructor(){
        owner = msg.sender;
        paused = false;
        balance[owner] = 1000;
    }

    // modifier is something which check the condition so whether we can call function or not
    modifier onlyOwner(){
        require(owner == msg.sender,"You are not owner!!");
        _;
    }

    modifier onlyPaused(){
        require(paused == false,"Contract is paused!!");
        _;
    }

    function pause() public onlyOwner{
        paused = true;
    }

    function unpause() public onlyOwner{
        paused = false;
    }

    function transfer(address add, uint amount) public  onlyOwner onlyPaused{
        require(amount<=balance[owner],"Insufficient balance");
        balance[owner] -= amount;
        balance[add] += amount;
    }
    // address public owner;
    // bool public paused;
    // mapping(address => uint) public balances;

    // constructor() {
    //     owner = msg.sender;
    //     paused = false;
    //     balances[owner] = 1000;
    // }

    // modifier onlyOwner() {
    //     // 1️⃣ Implement the modifier to allow only the owner to call the function
    //     require(owner == msg.sender,"You are not owner");
    //     _;
    // }

    // // 2️⃣ Implement the modifier to check if the contract is not paused
    // modifier notPaused(){
    //     require(paused==false,"Contract is paused");
    //     _;
    // }

    // function pause() public onlyOwner {
    //     paused = true;
    // }

    // function unpause() public onlyOwner {
    //     paused = false;
    // }

    // // 3️⃣ use the notPaused modifier in this function 
    // function transfer(address to, uint amount) public notPaused {
    //     require(balances[msg.sender] >= amount, "Insufficient balance");

    //     balances[msg.sender] -= amount;
    //     balances[to] += amount;
    // }
}
