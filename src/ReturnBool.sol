// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReturnBool {
    function main() external pure returns (bool) {
        assembly {
            // this code already works. Use it to test your setup.
            // the goal here is to return true

            // solution
            mstore(0x00, 0x01)
            return(0x00, 0x20)  
        }
    }
}
