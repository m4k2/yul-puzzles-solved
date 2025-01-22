// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract MaxOfArray {
    function main(uint256[] memory arr) external pure returns (uint256) {
        assembly {
            // your code here
            // return the maximum value in the array
            // revert if array is empty

            let l := mload(arr)

            if iszero(l) { revert(0x00, 0x00) }

            let ptr := add(arr, 0x20) // skip l slot

            let m := 0x00
            let v := 0x00

            for {let i := 0} lt(i, l) {i := add(i, 0x01)} {
                v := mload(add(ptr, mul(i, 0x20)))
                if gt(v, m) { m := v }
            }

            mstore(0x00, m)
            return(0x00, 0x20)
        }
    }
}
