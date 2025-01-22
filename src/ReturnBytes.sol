// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReturnBytes {
    function main(address a, uint256 b) external pure returns (bytes memory) {
        assembly {
            // your code here
            // encode a and b `abi.encode(a,b)` and return it.
            mstore(0x00, 0x20)
            mstore(0x20, 0x40)
            mstore(0x40, a)
            mstore(0x60, b)

            return(0x00, 0x80)
        }
    }
}
