// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract TransferFrom {
    address owner;
    address token;

    constructor(address _token) {
        owner = msg.sender;
        token = _token;
    }

    function main(uint256 amount) external {
        assembly {
            // your code here
            // transferFrom "token" to msg.sender "amount"
            // assume that you are already approved to spend "amount"
            // hint: you will need to sload the address of the token
            // hint: transferFrom has function selector 0x23b872dd and signature "transferFrom(address,address,uint256)"
        }
    }
}

