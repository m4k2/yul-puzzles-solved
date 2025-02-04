// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract SendEther {

    function main(address payable to, uint256 amount) external payable {
        assembly {
            // your code here
            // send `amount` of ether to `to`
            // assume `amount` is less than or equal to the contract balance
            // assume `amount` is in wei
            // hint: use the `call` opcode: https://docs.soliditylang.org/en/latest/yul.html#evm-dialect
            // hint: use the `gas` opcode to get the gas left
        }
    }
}