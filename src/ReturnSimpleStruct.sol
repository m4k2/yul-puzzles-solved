// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReturnSimpleStruct {
    // STRUCT
    struct Point {
        uint256 x;
        uint256 y;
    }

    function main(uint256 x, uint256 y) external pure returns (Point memory) {
        assembly {
            // your code here
            // return the struct: `Point{x,y}`

            mstore(0x00, x)
            mstore(0x20, y)

            return(0x00, 0x40)
        }
    }
}
