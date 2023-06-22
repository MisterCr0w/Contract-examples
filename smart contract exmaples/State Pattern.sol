pragma solidity ^0.8.12;

contract voteTally {
    enum State { Created, InProgress, Completed }

    address public owner;
    State public state;
    uint256 public votes;

    constructor() {
        owner = msg.sender;
        state = State.Created;
    }

    function start() public {
        require(msg.sender == owner, "must be owner to start");
        require(state == State.Created);
        state = State.InProgress;
    }

    function vote() external {
        require(state == State.InProgress, "must be in progress to vote");
        votes++;
    }

    function finish() public {
        require(msg.sender == owner, "must be owner to finish");
        require(state == State.InProgress, "must be in progress to finish");
        state = State.Completed;
    }
}