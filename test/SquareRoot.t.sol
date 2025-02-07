// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {SquareRoot} from "../src/SquareRoot.sol";

contract SquareRootTest is Test {
    SquareRoot public c;

    function setUp() public {
        c = new SquareRoot();
    }

    function test_squareRoot(uint256 n) public {
        uint256 x = bound(n, 0, 2**255); // avoid challenging cases when x is close to 2**256
        uint256 result = c.main(x);
        console.log("x", x, result);
        assert(result * result <= x);
        assert(x < (result + 1) * (result + 1));
    }
}
