// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {CreateSimple} from "../src/CreateSimple.sol";

contract Simple {
    constructor() payable {}
    function fallback() external payable {}
}

contract CreateSimpleTest is Test {
    CreateSimple createSimple;

    function setUp() public {
        createSimple = new CreateSimple();
    }

    function test_createSimple() public {
        bytes memory deploymentBytecode = type(Simple).creationCode;
    
        address addr = createSimple.main(deploymentBytecode);
        assert(addr != address(0));
        assert(addr.code.length > 0);
        assertEq(addr.code, type(Simple).runtimeCode);
    }
}