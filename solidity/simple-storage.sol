// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// 1
contract Greetings {
    string public greet;

    function viewGreeting() view public returns(string memory) {
        return greet;
    }
    
    function setAnotherGreeting(string memory newGreeting) public returns(string memory) {
        greet = newGreeting;
        return greet;
    }
}
