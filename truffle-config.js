const HDWalletProvider = require("truffle-hdwallet-provider");

// add your mnemonic here
const MNEMONIC =
  "battle bench guard balance kiss mushroom hybrid zone afraid industry point source";

module.exports = {
  networks: {
    oasis: {
      provider: function() {
        // console.log(
        //   new HDWalletProvider(MNEMONIC, "https://web3.oasiscloud.io")
        // );
        return new HDWalletProvider(MNEMONIC, "https://web3.oasiscloud.io");
      },
      network_id: "42261",
      gasPrice: "0x3b9aca00"
    }
  },
  compilers: {
    external: {
      command: "./node_modules/.bin/oasis-compile",
      targets: [
        {
          path: "./.oasis-build/*.json"
        }
      ]
    }
  }
};
