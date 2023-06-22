pragma solidity ^0.8.12;

interface IOracle {
    function getPrice() external view returns (uint);
}

contract MyContract {
    IOracle private oracle;

    constructor(address oracleAddress) {
        oracle = IOracle(oracleAddress);
    }

    function doSomething() external {
        uint price = oracle.getPrice();
        // do something with price
    }

}

contract MyOracle is IOracle {
    address public admin;
    uint256 private price;

    constructor(){
        admin = msg.sender;
    }

    function getPrice() external view override returns (uint) {
        return price;
    }

    function setPrice(uint256 _price) external {
        require(msg.sender == admin, "only admin can set price");
        // set pricefrom trusted source, represented by the admin address
        price = _price;
    }
}