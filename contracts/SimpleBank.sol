/*
    This exercise has been updated to use Solidity version 0.8.5
    See the latest Solidity updates at
    https://solidity.readthedocs.io/en/latest/080-breaking-changes.html
*/
// SPDX-License-Identifier: MIT
pragma solidity >=0.5.16 <0.9.0;

contract SimpleBank {

    //
    // State variables
    //
    
    // Fill in the keyword. 
    // Hint: We want to protect our users balance from other contracts
    mapping (address => uint) balances ;
    
    // Fill in the keyword. 
    // Hint: We want to create a getter function and allow contracts to be able
    // to see if a user is enrolled.
    mapping (address => bool) enrolled;

    // Let's make sure everyone knows who owns the bank. 
    // Hint: Use the appropriate keyword for this
    address owner = msg.sender;
    
    //
    // Events - publicize actions to external listeners
    //
    
    // Add an argument for this event, an accountAddress
    event LogEnrolled();

    // Add 2 arguments for this event, an accountAddress and an amount
    event LogDepositMade();

    // Create an event called LogWithdrawal
    // Hint: it should take 3 arguments: an accountAddress, withdrawAmount and a newBalance 
    event LogWithdrawal();

    //
    // Functions
    //

    // Fallback function - Called if other functions don't match call or
    // sent ether without data
    // Typically, called when invalid data is sent
    // Added so ether sent to this contract is reverted if the contract fails
    // otherwise, the sender's money is transferred to contract
    function () external payable {
        revert();
    }

    /// @notice Get balance
    /// @return The balance of the user
    // A SPECIAL KEYWORD prevents function from editing state variables;
    // allows function to run locally/off blockchain
    function getBalance() public returns (uint) {
      // 1. Get the balance of the sender of this transaction
    }

    /// @notice Enroll a customer with the bank
    /// @return The users enrolled status
    // Emit the appropriate event
    function enroll() public returns (bool){
      // 1. enroll of the sender of this transaction
    }

    /// @notice Deposit ether into bank
    /// @return The balance of the user after the deposit is made
    // Add the appropriate keyword so that this function can receive ether
    // Use the appropriate global variables to get the transaction sender and value
    // Emit the appropriate event    
    // Users should be enrolled before they can make deposits
    function deposit() public payable returns (uint) {
      // 1. Add the amount to the user's balance, 

      // 2. Emit the appropriate event associated with this function

      // 3. return the balance of sndr of this transaction
    }

    /// @notice Withdraw ether from bank
    /// @dev This does not return any excess ether sent to it
    /// @param withdrawAmount amount you want to withdraw
    /// @return The balance remaining for the user
    // Emit the appropriate event    
    function withdraw(uint withdrawAmount) public returns (uint) {
      // If the sender's balance is at least the amount they want to withdraw,
      // Subtract the amount from the sender's balance, and try to send that amount of ether
      // to the user attempting to withdraw. 
      // return the user's balance.

      // 1. Use a require expression to guard/ensure sender has enough funds

      // 2. Transfer Eth to the sender and decrement the withdrawal amount from
      //    sender's balance

      // 3. Emit the appropriate event for this message
    }
}
