// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReturnTupleOfUint256String {
    function main() external pure returns (uint256, string memory) {
        assembly {
            // your code here
            // return the tuple of (uint256 and string): (420, "RareSkills")

            mstore(0x00, 0x1a4)
            mstore(0x20, 0x40)
            mstore(0x40, 0x0a)
            mstore(0x60, "RareSkills")

            return(0x00, 0x80)
        }
    }
}
