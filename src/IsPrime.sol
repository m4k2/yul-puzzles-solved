// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract IsPrime {
    function main(uint256 x) external pure returns (bool) {
        assembly {
            // your code here
            // return true if x is a prime number, else false
            // 1. check if the number is a multiple of 2 or 3
            // 2. loop from 5 to x / 2 to see if it is divisible
            // 3. increment the loop by 2 to skip the even numbers

            if lt(x, 0x02) {return(0x00, 0x20)}
            if lt(x, 0x04) {mstore(0x00, 0x01) return(0x00, 0x20)}

            if or(
                eq(mod(x, 0x02), 0x00),
                eq(mod(x, 0x03), 0x00)
            ){
                return(0x00, 0x20)
            }


            let middle := add(shr(0x01, x),0x01)

            for {let i := 0x05} lt(i, middle) {i := add(i, 0x02)} {
                
                if eq(mod(x, i), 0x00) {return(0x00, 0x20)}
            }

            mstore(0x00, 0x01)
            return(0x00, 0x20)
        }
    }
}
