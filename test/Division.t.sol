// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Division} from "../src/Division.sol";

contract DivisonTest is Test {
    Division public c;

    function setUp() public {
        c = new Division();
    }

    function test_Division(int256 x, int256 y) public {
        if (y == 0) {
            vm.expectRevert();
            c.main(x, y);
        } else {
            int256 r = c.main(x, y);
            assertEq(r, x / y);
        }
    }
}
