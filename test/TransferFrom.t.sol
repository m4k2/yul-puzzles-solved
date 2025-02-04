// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {TransferFrom} from "../src/TransferFrom.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
    constructor() ERC20("RareSkills", "RS") {
        _mint(msg.sender, 1000);
    }
}

contract TransferFromTest is Test {
    TransferFrom public c;
    Token public token;
    function setUp() public {
        token = new Token();
        c = new TransferFrom(address(token));
    }

    function test_TransferFrom(uint256 amount) public {
        uint256 amt = bound(amount, 1, token.balanceOf(address(this)));
        token.approve(address(c), amt);
        c.main(amt);
        assertEq(token.balanceOf(address(c)), amt);
    }
}
