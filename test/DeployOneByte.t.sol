// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {DeployOneByte} from "../src/DeployOneByte.sol";

contract DeployOneByteTest is Test {
    DeployOneByte c;

    function setUp() public {
        c = new DeployOneByte();
    }

    function test_deployOneByte() public {
        address addr = c.main();
        assert(addr != address(0));
        assert(addr.code.length == 1);
        assertEq(addr.code, hex"00");
    }
}