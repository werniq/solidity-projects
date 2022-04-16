// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


// 2
contract Wallet {

    event Paid(address _from, uint _amoint, uint _timestamp);


    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not an owner");
        _;
    }
   
    function withdraw(address payable _to) payable external onlyOwner {
        _to.transfer(address(this).balance);

    }

    function showBalance() public view returns(uint) {
        uint balance = address(this).balance;
        return balance;
    }

    function sendEther(address payable _to) public payable {
        _to.transfer(msg.value);
        emit Paid(msg.sender, msg.value, block.timestamp);
    }
}
