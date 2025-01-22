// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToDynamicArray {
    uint256[] writeHere;

    function main(uint256[] memory x) external {
        assembly {
            // your code here
            // store the values in the DYNAMIC array `x` in the storage variable `writeHere`
            // Hint: https://www.rareskills.io/post/solidity-dynamic
            mstore(0x00, writeHere.slot)
            let ptr_s := keccak256(0x00, 0x20)

            let l := mload(x)
            sstore(writeHere.slot, l)

            let ptr_m := add(x, 0x20)

            for {let i := 0x00} lt(i, l) {i := add(i, 0x01)} {
                sstore(
                    add(ptr_s, i),
                    mload(add(ptr_m, mul(i, 0x20)))  
                )
            }

        }
    }

    function getter() external view returns (uint256[] memory) {
        return writeHere;
    }
}
