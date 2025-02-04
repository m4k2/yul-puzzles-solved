// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {SendAllEther} from "../src/SendAllEther.sol";

contract SimpleAllEtherTest is Test {
    SendAllEther public c;

    function setUp() public {
        c = new SendAllEther();
    }

    function test_SendAllEther(address to, uint256 amount) public {
        vm.assume(to != address(this) && uint160(to) > uint160(100));
        vm.assume(amount > 0);
        vm.assume(to.balance == 0);
        
        vm.deal(address(c), amount);
        c.main(payable(to));
        assertEq(to.balance, amount);
    }
}
