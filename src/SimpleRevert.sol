// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract SimpleRevert {

  function main() external pure {
      assembly {
          // your code here
          // revert with no message
          // hint: https://www.rareskills.io/post/assembly-revert
         
          // mstore(0x00, 0x00) is not needed since we're reverting without a message
          revert(0x00, 0x00)
      }
  }
}
