// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract SendAllEther {

    function main(address payable to) external payable {
        assembly {
            // your code here
            // send the entire contract balance to `to`
            // hint: use the `call` opcode: https://docs.soliditylang.org/en/latest/yul.html#evm-dialect
            // hint: use the `selfbalance()` opcode

        }
    }
}