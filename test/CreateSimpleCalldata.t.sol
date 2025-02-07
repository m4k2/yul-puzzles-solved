// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {CreateSimpleCalldata} from "../src/CreateSimpleCalldata.sol";

contract Simple {
    constructor() payable {}
    function fallback() external payable {}
}

contract CreateSimpleCalldataTest is Test {
    CreateSimpleCalldata createSimpleCalldata;

    function setUp() public {
        createSimpleCalldata = new CreateSimpleCalldata();
    }

    function test_createSimpleCalldata() public {
        bytes memory deploymentBytecode = type(Simple).creationCode;
    
        address addr = createSimpleCalldata.main(deploymentBytecode);
        assert(addr != address(0));
        assert(addr.code.length > 0);
        assertEq(addr.code, type(Simple).runtimeCode);
    }
}