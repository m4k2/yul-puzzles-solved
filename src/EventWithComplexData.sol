// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract EventWithComplexData {
    // EMIT ME!!!
    event MyEvent(address indexed emitter, address[] players, uint256[] scores);

    function main(address emitter, address[] memory players, uint256[] memory scores) external {
        assembly {
            // Calculate event signature hash
            mstore(0x00, "MyEvent(address,address[],uint25")
            mstore(0x20, "6[])")
            let h := keccak256(0x00, 0x24)

            // Get array lengths
            let l_p := mload(players)
            let l_s := mload(scores)
            
            // offset of players
            mstore(0x00, 0x40)
            // calcul offset of scores, which goes after players
            let o_s := add(0x60, mul(l_p, 0x20))
            mstore(0x20, o_s)
            
            // players length
            mstore(0x40, l_p)

            for {let i := 0x00} lt(i, l_p) {i := add(i, 0x01)} {
                mstore(add(0x60, mul(i, 0x20)), mload(add(add(players, 0x20), mul(i, 0x20))))
            }
            
            // scores length
            mstore(o_s, l_s)

            for {let i := 0x00} lt(i, l_s) {i := add(i, 0x01)} {
                mstore(add(add(o_s, 0x20), mul(i, 0x20)), mload(add(add(scores, 0x20), mul(i, 0x20))))
            }

            // calculate total length
            let t_s := add(add(o_s, 0x20), mul(l_s, 0x20))
            
            // Emit event with properly encoded data
            log2(0x00, t_s, h, emitter)
        }
    }
}