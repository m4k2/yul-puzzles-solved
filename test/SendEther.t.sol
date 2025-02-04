// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {SendEther} from "../src/SendEther.sol";

contract SimpleEtherTest is Test {
    SendEther public c;

    function setUp() public {
        c = new SendEther();
    }

    function test_SendEther(address to, uint256 amount) public {
        vm.assume(to != address(this) && uint160(to) > uint160(100) && to != address(c));
        vm.assume(amount > 0);
        vm.assume(to.balance == 0);
        
        vm.deal(address(c), amount);
        c.main(payable(to), amount);
        assertEq(to.balance, amount);
    }
}
