// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToFixedArray {
    uint256[5] writeHere;

    function main(uint256[5] memory x) external {
        assembly {
            // x already points to the start of the array data
            for {let i := 0x00} lt(i, 0x05) {i := add(i, 0x01)} {
                sstore(
                    add(writeHere.slot, i),
                    mload(add(x, mul(i, 0x20)))  
                )
            }
        }
    }

    function getter() external view returns (uint256[5] memory) {
        return writeHere;
    }
}
