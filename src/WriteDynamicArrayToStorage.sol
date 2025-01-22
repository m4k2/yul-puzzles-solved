// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteDynamicArrayToStorage {
    uint256[] public writeHere;

    function main(uint256[] calldata x) external {
        assembly {
            // your code here
            // write the dynamic calldata array `x` to storage variable `writeHere`

            let l := x.length

            sstore(writeHere.slot, l)

            mstore(0x00, writeHere.slot)
            let ptr_s := keccak256(0x00, 0x20)

            for {let i := 0x00} lt(i, l) {i := add(i, 0x01)} {
                sstore(add(ptr_s, i), calldataload(add(x.offset, mul(i, 0x20))))
            }
        }
    }
}
