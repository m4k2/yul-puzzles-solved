// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract Tenary {
    uint256 public result;

    function main(uint256 a, uint256 b, uint256 c) external {
        assembly {
            // your code here
            // store `10` in the storage variable `result` if a > b,
            // else if b > c, store `20`,
            // else, store `30`

            let v := 0x1e
            
            if gt(a, b) { 
                v := 0x0a 
            }
            if iszero(gt(a, b)) {
                if gt(b, c) { 
                    v := 0x14 
                }
            }
            
            sstore(result.slot, v)
        }
    }
}
