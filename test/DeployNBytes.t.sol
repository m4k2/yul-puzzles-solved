// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {DeployNBytes} from "../src/DeployNBytes.sol";

contract DeployNBytesTest is Test {
    DeployNBytes c;

    function setUp() public {
        c = new DeployNBytes();
    }

    function test_deployNBytes(uint256 x) public {
        uint256 n = bound(x, 0, 100);
        address addr = c.main(n);
        assert(addr != address(0));
        assert(addr.code.length == n);
    }
}