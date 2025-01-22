// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReturnTupleOfStringUnit256 {
    function main() external pure returns (string memory, uint256) {
        assembly {
            // your code here
            // return the tuple of (string and uint256): ("RareSkills", 420)

            mstore(0x00, 0x40)
            mstore(0x20, 0x1a4)
            mstore(0x40, 0x0a)
            mstore(0x60, "RareSkills")

            return(0x00, 0x80)
        }
    }
}
