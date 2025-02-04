// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract PaymentSplitter {

    function main(address[] calldata recipients) external payable {
        assembly {
            // your code here
            // send the entire contract balance to the recipients
            // each recipient gets balance / recipients.length

        }
    }
}