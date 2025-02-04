// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {BalanceOf} from "../src/BalanceOf.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
    constructor() ERC20("RareSkills", "RS") {

    }

    function mint(address to, uint256 amount) external {
        _mint(to, amount);
    }
}

contract BalanceOfTest is Test {
    BalanceOf public c;
    Token public token;
    function setUp() public {
        c = new BalanceOf();
        token = new Token();
    }

    function test_BalanceOf(uint256 amount) public {
        token.mint(address(c), amount);
        uint256 bal = c.main(address(token));
        assertEq(amount, bal);
    }
}
