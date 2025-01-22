// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract DoubleOrNothing {
    function main(uint256 x) external pure returns (uint256) {
        assembly {
            // your code here
            // return 2 * x if the product is
            // 21 or less. If 2 * x > 21, then
            // return 0.
            // Hint: check if x ≤ 10, which is equivalent to x < 11
            if iszero(lt(x, 11)){
                return(0x00, 0x20) // returns 0 since memory at 0x00 is empty (defaults to 0)
            }
            mstore(0x00, add(x, x))
            return(0x00, 0x20)


        }
    }
}
