
// DO NOT USE!! THIS CONTRACT HAS SECURITY FLAWS!!!

pragma solidity ^0.8.8;

contract SingletonFactory {

    function deploy(bytes memory _initCode, bytes32 _salt)
        public
        returns (address payable createdContract)

    {
        assembly {
            createdContract := create2(0, add(_initCode, 0x20), mload(_initCode), _salt)
        }
    }    
}