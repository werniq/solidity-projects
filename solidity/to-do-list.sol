// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


// 3
contract ToDoList {
    struct ToDo {
        string text;
        bool completed;
    }

    ToDo[] public actions; 

    function createAction(string memory _text) private {
        actions.push(ToDo(_text, false));
    }

    function get(uint _index) public view returns(string memory text, bool completed) {
        ToDo storage todo = actions[_index];
        return (todo.text, todo.completed);
    }

    function updateText(string memory newText, uint _index) public {
        ToDo storage todo = actions[_index];
        todo.text = newText;
    }

    function setCompleted(uint _index) public {
        ToDo storage todo = actions[_index];
        todo.completed = !todo.completed;
    }
}

