pragma solidity ^0.8.12;

contract MyContract {
    uint256 public data;

    constructor(uint256 _data) {
        data = _data;
    }
}

contract MyContractFactory {
    mapping(address -> address) public myContracts;

    function createMyContract(uint256 _data) public {
        address newContract = address(new MyContract(_data));
        myContracts[msg.sender] = newContract;
    }
}