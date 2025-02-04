// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract BasicBank {
    // emit these
    event Deposit(address indexed depositor, uint256 amount);
    event Withdraw(address indexed withdrawer, uint256 amount);

    error InsufficientBalance();

    mapping(address => uint256) public balances;

    function deposit() external payable {
        bytes32 depositSelector = Deposit.selector;
        assembly {
            // emit Deposit(msg.sender, msg.value)
            // increment the balance of the msg.sender by msg.value
        }
    }

    function withdraw(uint256 amount) external returns (uint256 bal) {
        bytes32 withdrawSelector = Withdraw.selector;
        bytes4 insufficientBalanceSelector = InsufficientBalance.selector;
        assembly {
            // emit Withdraw(msg.sender, amount)
            // if the balance is less than amount, revert InsufficientBalance()
            // decrement the balance of the msg.sender by amount
            // send the amount to the msg.sender
        }
    }
}

