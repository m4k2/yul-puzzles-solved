// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReturnArrayOfUint256 {
    function main(uint256 a, uint256 b, uint256 c) external pure returns (uint256[] memory) {
        assembly {
            // your code here
            // return an array of [a,b,c]

            mstore(0x00, 0x20)
            mstore(0x20, 0x03)
            mstore(0x40, a)
            mstore(0x60, b)
            mstore(0x80, c)

            return(0x00, 0xc0)
        }
    }
}
