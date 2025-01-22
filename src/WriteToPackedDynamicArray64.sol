// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToPackedDynamicArray64 {
    uint64[] public writeHere;

    function main(uint64 v1, uint64 v2, uint64 v3, uint64 v4, uint64 v5) external {
        assembly {
            // your code here
            // write the code to store v1, v2, v3, v4, and v5 in the `writeHere` array in sequential order.
            // Hint: `writeHere` is a dynamic array, so you will need to access its length and use `mstore` or `sstore`
            // appropriately to push new values into the array.

            sstore(writeHere.slot, 0x05)

            mstore(0x00, writeHere.slot)
            let ptr_s := keccak256(0x00, 0x20)

            sstore(
                ptr_s,
                or(
                    or(
                        or(
                            shl(0xc0, v4),
                            shl(0x80, v3)
                        ),
                        shl(0x40, v2)
                    ),
                    v1
                )
            )

            sstore(add(ptr_s, 0x01), v5)
        }
    }
}
