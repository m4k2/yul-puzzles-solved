// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract Approve {
    // emit these
    function main(address token, uint256 amount) external {
        assembly {
            // your code here
            // approve "token" to spend "amount"
            // hint: approve has function selector 0x095ea7b3 and signature "approve(address,uint256)"
            mstore(0x00, 0x095ea7b300000000000000000000000000000000000000000000000000000000)
            mstore(0x04, token)
            mstore(0x24, amount)
            pop(call(gas(), token, 0x00, 0x00, 0x44, 0x00, 0x00))
       }
    }
}

