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
        vm.assume(to != 0x4e59b44847b379578588920cA78FbF26c0B4956C); // Create2 addr
        vm.assume(to != 0x7109709ECfa91a80626fF3989D68f67F5b1DD12D); // VM addr

        
        vm.deal(address(c), amount);
        c.main(payable(to));
        assertEq(to.balance, amount);
    }
}
