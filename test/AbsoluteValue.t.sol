// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {AbsoluteValue} from "../src/AbsoluteValue.sol";

contract AbsoluteValueTest is Test {
    AbsoluteValue public c;

    function setUp() public {
        c = new AbsoluteValue();
    }

    function test_absoluteValue(int256 x) public {
        vm.assume(x > type(int256).min);
        uint256 abs = c.main(x);
        if (x < 0) {
            assertEq(abs, uint256(-x));
        } else {
            assertEq(abs, uint256(x));
        }
    }
}
