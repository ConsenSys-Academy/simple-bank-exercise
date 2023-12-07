/*
 * This exercise has been updated to use Solidity version 0.8.5
 * See the latest Solidity updates at
 * https://solidity.readthedocs.io/en/latest/080-breaking-changes.html
 */
// SPDX-License-Identifier: MIT
pragma solidity >=0.5.16 <0.9.0;

contract SimpleBank {
    /* State variables
     */

    // Users balances, protected from other contracts.
    mapping(address => uint) private balances;

    // Enrolled users, allowed from other contracts to view.
    mapping(address => bool) public enrolled;

    // Who owns the bank.
    address public owner = msg.sender;

    /* Modifiers - better validations.
     */

    // @notice Make sure only enrolled users can call functions.
    modifier onlyEnrolled() {
        require(
            enrolled[msg.sender] == true,
            "Only enrolled users can call this function"
        );
        _;
    }

    // @notice Make sure a user does not enroll twice.
    modifier notEnrolled() {
        require(enrolled[msg.sender] == false, "User already enrolled.");
        _;
    }

    /* Events - publicize actions to external listeners
     */

    event LogEnrolled(address indexed accountAddress);

    event LogDepositMade(address indexed accountAddress, uint amount);

    event LogWithdrawal(
        address indexed accountAddress,
        uint withdrawAmount,
        uint newBalance
    );

    /* Functions
     */

    // Set the owner to the creator of this contract.
    constructor() {
      owner = msg.sender;
    }

    // Fallback function - returns ether if something's wrong with the call.
    fallback() external payable {
        revert();
    }

    // Handle empty calldata.
    receive() external payable {
    }

    /// @notice Get balance
    /// @return The balance of the user
    function getBalance() public view returns (uint) {
        return balances[msg.sender];
    }

    /// @notice Enroll a customer with the bank
    /// @return The users enrolled status
    function enroll() public notEnrolled returns (bool) {
      address sender = address(msg.sender);
      enrolled[sender] = true;
      emit LogEnrolled(sender);
      return enrolled[sender];
    }

    /// @notice Deposit ether into bank
    /// @return The balance of the user after the deposit is made
    function deposit() public payable onlyEnrolled returns (uint) {
      address sender = address(msg.sender);
      balances[sender] += msg.value;
      emit LogDepositMade(sender, msg.value);
      return balances[sender];
    }

    /// @notice Withdraw ether from bank
    /// @dev This does not return any excess ether sent to it
    /// @dev https://blog.b9lab.com/the-solidity-withdrawal-pattern-1602cb32f1a5
    /// @param withdrawAmount amount you want to withdraw
    /// @return The balance remaining for the user
    function withdraw(uint withdrawAmount) public onlyEnrolled returns (uint) {
      address sender = address(msg.sender);      
      // Ensure sender has enough funds.
      require(
        balances[sender] >= withdrawAmount,
        "Withdraw amount is too much."
      );

      // optimistic accounting
      balances[sender] -= withdrawAmount;

      // transfer
      payable(sender).transfer(withdrawAmount);

      // emit event
      uint newBalance = balances[msg.sender];
      emit LogWithdrawal(msg.sender, withdrawAmount, newBalance);

      return newBalance;
    }
}
