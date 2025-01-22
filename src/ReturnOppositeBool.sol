// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReturnOppositeBool {
    function main(bool _bool) external pure returns (bool) {
        assembly {
            // your code here
            // return the opposite of `_bool`
            mstore(0x00, xor(_bool, 0x01))

            return(0x00, 0x20)
        }
    }
}

