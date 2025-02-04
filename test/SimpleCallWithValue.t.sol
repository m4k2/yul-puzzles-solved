// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {SimpleCallWithValue} from "../src/SimpleCallWithValue.sol";

contract T {
    bool public x = false;
    function foo() external payable {
        x = true;
    }
}

contract SimpleCallWithValueTest is Test {
    SimpleCallWithValue public c;
    T public t;

    function setUp() public {
        c = new SimpleCallWithValue();
        t = new T();
    }

    function test_SimpleCallWithValue(uint256 value) public {
        vm.assume(value < 100e18);
        vm.deal(address(this), value);
        vm.deal(address(c), 1); // make selfbalance() break
        c.main{value: value}(address(t));
        assertEq(t.x(), true);
        assertEq(address(t).balance, value);
    }
}