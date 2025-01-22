// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteTwoDynamicArraysToStorage {
    uint256[] public writeHere1;
    uint256[] public writeHere2;

    function main(uint256[] calldata x, uint256[] calldata y) external {
        assembly {
            // your code here
            // write the dynamic calldata array `x` to storage variable `writeHere1` and
            // dynamic calldata array `y` to storage variable `writeHere2`

            let arrays_data := x.offset   
            let storage_slots := writeHere1.slot
            
            for { let arr := 0 } lt(arr, 2) { arr := add(arr, 1) } {
                mstore(0x00, storage_slots)
                let ptr_s := keccak256(0x00, 0x20)
                
                let l := calldataload(sub(arrays_data, 0x20))
                sstore(storage_slots, l)
                
                for {let i := 0x00} lt(i, l) {i := add(i, 0x01)} {
                    sstore(
                        add(ptr_s, i),
                        calldataload(add(arrays_data, mul(i, 0x20)))
                    )
                }
                
                arrays_data := y.offset
                storage_slots := writeHere2.slot
            }
        }
    }
}
