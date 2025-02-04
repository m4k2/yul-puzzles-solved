// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {BasicBank} from "../src/BasicBank.sol";

contract BasicBankTest is Test {
    BasicBank public c;
    event Deposit(address indexed depositor, uint256 amount);
    event Withdraw(address indexed withdrawer, uint256 amount);

    error InsufficientBalance();

    function setUp() public {
        c = new BasicBank();
    }

    function test_DepositEvent(uint256 value) public {
        vm.deal(address(this), value);
        vm.expectEmit();
        emit Deposit(address(this), value);
        c.deposit{value: value}();
    }

    function test_DepositBalance(uint256 value) public {
        vm.deal(address(this), value);
        c.deposit{value: value}();
        assertEq(c.balances(address(this)), value);
    }

    function test_WithdrawEvent(uint256 value) public {
        vm.deal(address(this), value);
        c.deposit{value: value}();
        assertEq(c.balances(address(this)), value);
        vm.expectEmit();
        emit Withdraw(address(this), value);
        c.withdraw(value);
    }

    function test_WithdrawOverdraft(uint256 value) public {
        vm.assume(value < 100e18);
        vm.deal(address(this), value);
        c.deposit{value: value}();
        vm.expectRevert(InsufficientBalance.selector);
        c.withdraw(value + 1);
    }

    function test_WithdrawHappyCase(uint256 value) public {
        vm.assume(value < 100e18 && value > 1e18);
        vm.deal(address(this), value);
        c.deposit{value: value}();
        c.withdraw(value - 10);
        assertEq(c.balances(address(this)), 10);
    }

    receive() external payable {

    }
}
