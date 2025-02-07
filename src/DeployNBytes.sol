// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract DeployNBytes {
    function main(uint256 size) external returns (address) {
        assembly {
            // your code here
            // create a contract that is size bytes long
            // hint: you will need to generalize the init code of DeployOneByte
            // hint: use mstore8 to target a single byte
            // hint: because we only care about the size, you can simply return that region
            //       of memory and not care about what is inside it

            mstore(0x00, 0x60016000f3)
            mstore8(0x1c, size)
            let addr := create(0x00, 0x1b, 0x05)

            mstore(0x00, addr)
            return(0x00, 0x20)
       }
    }
}
