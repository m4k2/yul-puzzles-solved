// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Log2} from "../src/Log2.sol";

contract Log2Test is Test {
    Log2 public c;

    function setUp() public {
        c = new Log2();
    }

    function test_Log2(uint256 x) public {

        if (x == 0) {
            vm.expectRevert();
            c.main(x);
        }
        else {
            uint256 ans = c.main(x);
            if (ans <= 254) {
                assert(2 ** ans <= x);
                assert(x < 2 ** (ans + 1));
            } else {
                assert(x >= 2 ** 255);
            }
        }
    }
}
