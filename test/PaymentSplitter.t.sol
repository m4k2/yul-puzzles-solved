// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {PaymentSplitter} from "../src/PaymentSplitter.sol";

contract PaymentSplitterTest is Test {
    PaymentSplitter public c;

    function setUp() public {
        c = new PaymentSplitter();
    }

    function validateAddress(address to) internal {
        vm.assume(to != address(this) && uint160(to) > uint160(100) && to != address(c));
        vm.assume(to.balance == 0);
        vm.assume(to.code.length == 0);
        vm.assume(to != 0x000000000000000000636F6e736F6c652e6c6f67); // console.log address
    }

    function test_PaymentSplitterOneRecipient(address to, uint256 amount) public {
        validateAddress(to);

        vm.deal(address(c), amount);
        address[] memory tos = new address[](1);
        tos[0] = to;
        c.main(tos);
        assertEq(to.balance, amount);
    }

    function test_PaymentSplitterTwoRecipient(address to1, address to2, uint256 amount) public {
        validateAddress(to1);
        validateAddress(to2);
        vm.assume(to1 != to2);

        vm.deal(address(c), amount);
        address[] memory tos = new address[](2);
        tos[0] = to1;
        tos[1] = to2;
        c.main(tos);
        assertEq(to1.balance, amount / 2);
        assertEq(to2.balance, amount / 2);
    }

    function test_PaymentSplitterThreeRecipient(address to1, address to2, address to3, uint256 amount) public {
        validateAddress(to1);
        validateAddress(to2);
        validateAddress(to3);
        vm.assume(to1 != to2 && to1 != to3 && to2 != to3);

        vm.deal(address(c), amount);

        address[] memory tos = new address[](3);
        tos[0] = to1;
        tos[1] = to2;
        tos[2] = to3;
        c.main(tos);
        assertEq(to1.balance, amount / 3);
        assertEq(to2.balance, amount / 3);
        assertEq(to3.balance, amount / 3);
    }
}