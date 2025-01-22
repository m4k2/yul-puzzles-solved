// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract CalculatorInFallback {
    uint256 public result;

    fallback() external {
        // your code here
        // compare the function selector in the calldata with the any of the selectors below, then
        // execute a logic based on the right function selector and store the result in `result` variable.
        // assumming operations won't overflow

        // add(uint256,uint256) -> 0x771602f7 (add two numbers and store result in storage)
        // sub(uint256,uint256) -> 0xb67d77c5 (sub two numbers and store result in storage)
        // mul(uint256,uint256) -> 0xc8a4ac9c (mul two numbers and store result in storage)
        // div(uint256,uint256) -> 0xa391c15b (div two numbers and store result in storage)

        assembly {
            let s := shr(0xe0, calldataload(0x00))
            
            let a := calldataload(0x04)
            let b := calldataload(0x24)

            switch s
            case 0x771602f7 {
                sstore(0x00, add(a, b))
            }
            case 0xb67d77c5 { 
                sstore(0x00, sub(a, b))
            }
            case 0xc8a4ac9c { 
                sstore(0x00, mul(a, b))
            }
            case 0xa391c15b { 
                if iszero(b) {revert(0x00, 0x00)}
                sstore(0x00, div(a, b))
            }
        }
    }
}