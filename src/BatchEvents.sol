// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract BatchEvents {
    // EMIT ME!!!
    event MyEvent(address indexed emitter, bytes32 indexed id, uint256 num);

    function main(address[] memory emitters, bytes32[] memory ids, uint256[] memory nums) external {
        assembly {
            // your code here
            // emit the `MyEvent(address,bytes32,uint256)` event
            // Assuming all arrays (emitters, ids, and nums) are of equal length.
            // iterate over the set of parameters and emit events based on the array length.

            let l := mload(emitters)

            mstore(0x00, "MyEvent(address,bytes32,uint256)")
            let h := keccak256(0x00, 0x20)

            for {let i := 0x00} lt(i, l) {i := add(i, 0x01)} {
                let emitter := mload(add(add(emitters, 0x20), mul(i, 0x20)))
                let id := mload(add(add(ids, 0x20), mul(i, 0x20)))
                let num := mload(add(add(nums, 0x20), mul(i, 0x20)))

                mstore(0x00, num)
                
                log3(0x00, 0x20, h, emitter, id)
            }
        }
    }
}