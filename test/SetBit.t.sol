// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {SetBit} from "../src/SetBit.sol";

contract SetBitTest is Test {
    SetBit public c;

    function setUp() public {
        c = new SetBit();
    }

    function test_setBit(uint256 x, uint8 i) public {
        uint256 result = c.main(x, i);
        assertEq(result, x | (1 << i));
    }
}
