# Simple Bank Exercise

SimpleBank is a [Truffle](https://www.trufflesuite.com/) project that contains
a starter contract,
[migration](https://www.trufflesuite.com/docs/truffle/getting-started/running-migrations#migration-files)
and [Truffle JavaScript test
files](https://www.trufflesuite.com/docs/truffle/testing/writing-tests-in-javascript).
In this exercise you are going to implement the SimpleBank.sol contract.

## Setting The Stage

<img  align="right" src="https://live.staticflickr.com/6179/6201850469_51ce8e1f8a.jpg" width="170">

We want to create a depository institution on the Ethereum blockchain, and we need your help! <br/>
The bank should be able to enroll new users and allow them to make deposits / widthdrawals! <br/><br/>

## Files

  * `contracts/SimpleBank.sol`
    : the partial implementation of a Solidity Contract you will complete. 
  * `test/simpleBank.test.js`
    : the Truffle test file that describes the behavior of a correct SimpleBank
    contract.

## Requirements
  1. Latest truffle version.
     ```console
     npm -g uninstall truffle && npm -g install truffle
     ```
  1. Install dependencies.
    ```console
    npm install
    ```
  1. Your preferred code editor.
  1. Familiarity with terminals.

## Instructions

Follow the comments outlined in SimpleBank.sol to implement its
functionality. The test are there to determine correct contract behavior as
well as guide you through the implementation. 

The general workflow is to use Test Drive Development's red green process:
  1. Run `truffle test` from a terminal.
  2. Use the failed test output along with the hints in
     `contracts/SimpleBank.sol` to make the test pass.

<!-- <details><summary>Video: Run a test example</summary>

[![asciicast](https://asciinema.org/a/u3oXwF8qKruSN81sm8MGsmTf0.png)](https://asciinema.org/a/u3oXwF8qKruSN81sm8MGsmTf0)

</details> -->

Note: Truffle will default to use a Solidity 0.5.x compiler with this contract as-is. To use the latest 0.8.x compiler, please comment out lines 9-14 in [truffle-config.js.](truffle-config.js)

### Note on testing

 Check out the testing files to see how tests are implemented in JavaScript.
 We will go over the details of implementing tests later in the curriculum. Of
 course, if you have questions, do reach out in Discord, or schedule an Office
 Hour session with one of our mentors.
