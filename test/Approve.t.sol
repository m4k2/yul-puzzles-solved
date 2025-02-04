// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Approve} from "../src/Approve.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
    constructor() ERC20("RareSkills", "RS") {

    }
}

contract ApproveTest is Test {
    Approve public c;
    Token public token;
    function setUp() public {
        c = new Approve();
        token = new Token();
    }

    function test_Approve(uint256 amount) public {
        c.main(address(token), amount);
        assertEq(token.allowance(address(c), address(token)), amount);
    }
}
