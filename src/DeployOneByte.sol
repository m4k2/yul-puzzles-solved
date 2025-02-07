// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

/*
  Initialization Code:
  
  60 01
  PUSH1 0x01
  Push the length (1 byte) of the runtime code onto the stack.
  
  60 0c
  PUSH1 0x0c
  Push the offset where the runtime code begins. Here the init code is 12 bytes long (0x0c in hex).
  
  60 00
  PUSH1 0x00
  Push the memory destination offset (0) where the runtime code will be copied.
  
  39
  CODECOPY
  Copy 1 byte (the length from earlier) from the code starting at offset 0x0c (i.e. right after this init code) into memory at offset 0.
  
  60 01
  PUSH1 0x01
  Push the length (1 byte) again for the return.
  
  60 00
  PUSH1 0x00
  Push the memory start (0) for returning.
  
  f3
  RETURN
  Return the 1 byte from memory as the contract’s runtime code.
  
  Runtime Code (appended byte):
  
  00
  This is the one byte that will be installed as the deployed contract’s code. In EVM, 0x00 is the STOP opcode.
*/

contract DeployOneByte {
    function main() external returns (address) {
        assembly {
            // your code here
            // create a contract that has a single byte in its code
            // return the address of the contract
            // hint: use the bytecode in the comment above
        }
    }
}
