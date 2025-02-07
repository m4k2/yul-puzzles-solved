// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {CreateSimplePayable} from "../src/CreateSimplePayable.sol";

contract Simple {
    constructor() payable {}
    function fallback() external payable {}
}

contract CreateSimplePayableTest is Test {
    CreateSimplePayable c;

    function setUp() public {
        c = new CreateSimplePayable();
    }

    function test_createSimplePayable(uint256 value) public {
        vm.deal(address(this), value);

        bytes memory deploymentBytecode = type(Simple).creationCode;
    
        address addr = c.main{value: value}(100, deploymentBytecode);
        assert(addr != address(0));
        assert(addr.code.length > 0);
        assertEq(addr.code, type(Simple).runtimeCode);
        assertEq(addr.balance, value);
    }
}