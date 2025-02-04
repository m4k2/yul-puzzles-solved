// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract PaymentSplitter {

    function main(address[] calldata recipients) external payable {
        assembly {
            // your code here
            // send the entire contract balance to the recipients
            // each recipient gets balance / recipients.length

            let l := recipients.length
            let v := div(selfbalance(), l)

            let s := recipients.offset

            for {let i := 0} lt(i, l) {i := add(i, 1)}{
                let a := calldataload(add(s, mul(i, 0x20)))
                pop(call(gas(), a, v, 0x00, 0x00, 0x00, 0x00))
            }

        }
    }
}