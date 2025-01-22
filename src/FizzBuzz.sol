// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract FizzBuzz {
    function main(uint256 num) external pure returns (string memory) {
        assembly {
            // your code here
            // if `num` is divisible by 3 return the word "fizz",
            // if divisible by 5 with the word "buzz",
            // if divisible by both 3 and 5 return the word "fizzbuzz",
            // else return an empty string "".

            // Assume `num` is greater than 0.

            let result := 0x00
            if iszero(mod(num, 0x03)) {result := 0x01}
            if iszero(mod(num, 0x05)) {result := or(result, 0x02)}
            
            switch result
            case 0x00 {mstore(0x00, 0x20) mstore(0x20, 0x00)}
            case 0x01 {mstore(0x00, 0x20) mstore(0x20, 0x04) mstore(0x40, "fizz")}
            case 0x02 {mstore(0x00, 0x20) mstore(0x20, 0x04) mstore(0x40, "buzz")}
            case 0x03 {mstore(0x00, 0x20) mstore(0x20, 0x08) mstore(0x40, "fizzbuzz")}

            return(0x00, 0x60)

        }
    }
}
