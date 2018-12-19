/*

This test file has been updated for Truffle version 5.0. If your tests are failing, make sure that you are
using Truffle version 5.0. You can check this by running "trufffle version"  in the terminal. If version 5 is not
installed, you can uninstall the existing version with `npm uninstall -g truffle` and install the latest version (5.0)
with `npm install -g truffle`.

*/

var SimpleBank = artifacts.require("./SimpleBank.sol");

contract('SimpleBank', function(accounts) {

  const owner = accounts[0]
  const alice = accounts[1];
  const bob = accounts[2];
  const deposit = web3.utils.toBN(2);

  it("mark addresses as enrolled", async () => {
    const bank = await SimpleBank.deployed();

    await bank.enroll({from: alice});

    const aliceEnrolled = await bank.enrolled(alice, {from: alice});
    assert.equal(aliceEnrolled, true, 'enroll balance is incorrect, check balance method or constructor');

    const ownerEnrolled = await bank.enrolled(owner, {from: owner});
    assert.equal(ownerEnrolled, false, 'only enrolled users should be marked enrolled');
  });

  it("should deposit correct amount", async () => {
    const bank = await SimpleBank.deployed();

    await bank.enroll({from: alice});
    await bank.enroll({from: bob});

    var result = await bank.deposit({from: alice, value: deposit});
    const balance = await bank.balance({from: alice});

    assert.equal(deposit.toString(), balance, 'deposit amount incorrect, check deposit method');

    const expectedEventResult = {accountAddress: alice, amount: deposit};

    const logAccountAddress = result.logs[0].args.accountAddress;
    const logDepositAmount = result.logs[0].args.amount.toNumber();

    assert.equal(expectedEventResult.accountAddress, logAccountAddress, "LogDepositMade event accountAddress property not emitted, check deposit method");
    assert.equal(expectedEventResult.amount, logDepositAmount, "LogDepositMade event amount property not emitted, check deposit method");
  });

  it("should withdraw correct amount", async () => {
    const bank = await SimpleBank.deployed();
    const initialAmount = 0;
   
	var result = await bank.withdraw(deposit, {from: alice});
    const balance = await bank.balance({from: alice});

    assert.equal(balance.toString(), initialAmount.toString(), 'balance incorrect after withdrawal, check withdraw method');

    const accountAddress = result.logs[0].args.accountAddress;
    const newBalance = result.logs[0].args.newBalance.toNumber();
    const withdrawAmount = result.logs[0].args.withdrawAmount.toNumber();

    const expectedEventResult = {accountAddress: alice, newBalance: initialAmount, withdrawAmount: deposit};


    assert.equal(expectedEventResult.accountAddress, accountAddress, "LogWithdrawal event accountAddress property not emitted, check deposit method");
    assert.equal(expectedEventResult.newBalance, newBalance, "LogWithdrawal event newBalance property not emitted, check deposit method");
    assert.equal(expectedEventResult.withdrawAmount, withdrawAmount, "LogWithdrawal event withdrawalAmount property not emitted, check deposit method");

  });
});
