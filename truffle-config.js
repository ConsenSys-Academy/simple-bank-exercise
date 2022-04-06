module.exports = {
  networks: {
      development: {
          host: 'localhost',
          port: 8545,
          network_id: '*'
      }
  }
  // // To run contract with the latest compiler, uncomment lines 10-14 below:
  // compilers: { 
  //   solc: {
  //     version: "^0.8",    // Fetch latest 0.8.x Solidity compiler 
  //   }
  // }
};
