// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

//contract using the DataLocations concept
contract TodoList {
    struct Todo {
        string task;
        bool completed;
    }
    Todo[] public todos;

    function create(string calldata _task) public {
        Todo memory todo = Todo({task: _task, completed: false});
        todos.push(todo);
    }

    function changeText(uint256 index, string calldata _task) public {
        todos[index].task = _task;
    }

    function makeComplete(uint256 index) public {
        todos[index].completed = !todos[index].completed;
    }

    function viewTodo(uint256 index) public view returns (string memory, bool) {
        Todo memory any = todos[index];
        return (any.task, any.completed);
    }
}
