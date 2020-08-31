module.exports = {
  compilers: {
    solc: '0.6.12',
    settings: {
      evmVersion: "byzantium"
    }
  },
  networks: {
    development: {
      host: "localhost",
      port: 8545,
      network_id: "*" // Match any network id
    }
  }
};
