// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract AnonymonusEventWithComplexData {
    enum Gender {
        Male,
        Female,
        Trans
    }

    struct Person {
        string name;
        uint256 age;
        Gender gender;
    }

    // EMIT ME!!!
    event MyEvent(address indexed emitter, bytes32 indexed id, Person person);

    function main(address emitter, bytes32 id, Person memory person) external {
        assembly {    
            
            // This one is complexe compare to other imo, so I add some comment =)

            mstore(0x00, 0x20)
            // offset name
            mstore(0x20, 0x60)
            // age
            mstore(0x40, mload(add(person, 0x20)))
            // gender
            mstore(0x60, mload(add(person, 0x40)))
            
            let namePointer := mload(person)
            let nameLength := mload(namePointer)
            
            // name length
            mstore(0x80, nameLength)
            
            let wordCount := add(div(nameLength, 0x20), 0x01)

            // Copy string data word by word
            for {let wordOffset := 0x00} lt(wordOffset, mul(wordCount, 0x20)) {wordOffset := add(wordOffset, 0x20)} {
                mstore(
                    add(0xa0, wordOffset),
                    mload(add(namePointer, add(0x20, wordOffset)))
                )
            }
            
            log3(0x00, add(0xa0, mul(wordCount, 0x20)), 0x00, emitter, id)
        }
    }
}
