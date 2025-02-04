// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {SendBack} from "../src/SendBack.sol";

contract SendBackTest is Test {
    SendBack public c;

    function setUp() public {
        c = new SendBack();
    }


    function test_SendBack(uint256 value) public {
        
        vm.deal(address(this), value);
        (bool ok, ) = address(c).call{value: value}("");
        console.log("ok", ok);
        assertEq(address(this).balance, value);
    }

    receive() external payable {

    }
}
