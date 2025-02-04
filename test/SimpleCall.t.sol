// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {SimpleCall} from "../src/SimpleCall.sol";

contract T {
    bool public x = false;
    function foo() external {
        x = true;
    }
}

contract SimpleCallTest is Test {
    SimpleCall public c;
    T public t;

    function setUp() public {
        c = new SimpleCall();
        t = new T();
    }

    function test_SimpleCall() public {
        c.main(address(t));
        assertEq(t.x(), true);
    }
}