// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract CreateSimpleCalldata {
    function main(bytes calldata deploymentBytecode) external returns (address) {
        assembly {
            // your code here
            // create a contract using the deploymentBytecode
            // return the address of the contract
            // hint: use the `create` opcode
            // hint: use calldatacopy to copy the deploymentBytecode to memory

            calldatacopy(0x00, deploymentBytecode.offset, deploymentBytecode.length)

            let addr := create(0x00, 0x00, deploymentBytecode.length)

            mstore(0x00, addr)
            return(0x00, 0x20)
       }
    }
}