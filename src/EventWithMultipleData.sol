// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract EventWithMultipleData {
    // EMIT ME!!!
    event MyEvent(address emitter, uint256 num, bool isActive);

    function main(address emitter, uint256 num, bool isActive) external {
        assembly {
            // your code here
            // emit the `MyEvent(address,uint256,bool)` event
            // the event has three fields of data: an address, a uint256, and a bool
            // use `log1` to emit the event with one topic (the event signature hash) and the data payload
            // Hint: Pack the `emitter`, `num`, and `isActive` values in memory for the data payload
            // Note: Ensure the data layout in memory matches the event parameter order

            mstore(0x00, "MyEvent(address,uint256,bool)")
            mstore(0x80, emitter) // ADHD in action, could not overwritte usual fmp and zero slot =|, even if here there is not
            mstore(0xa0, num)
            mstore(0xc0, isActive)

            log1(0x80, 0x60, keccak256(0x00, 0x1d))
        }
    }
}
