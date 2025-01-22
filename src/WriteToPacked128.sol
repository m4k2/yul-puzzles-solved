// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToPacked128 {
    uint128 public writeHere = 1;
    uint128 public someValue = 7;

    function main(uint256 v) external {
        assembly {
            // your code here
            // change the value of `writeHere` storage variable to `v`
            // be careful not to alter the value of `someValue` variable
            // Hint: storage slots are arranged sequentially. Determine the storage slot of `writeHere`
            // and use `sstore` to modify only the `writeHere` variable.
            let clean_v := and(
                            sload(writeHere.slot), 
                            not(0x00000000000000000000000000000000ffffffffffffffffffffffffffffffff)
                            )
            let new_v := or(clean_v, v)

            sstore(writeHere.slot, new_v)
        }
    }
}
