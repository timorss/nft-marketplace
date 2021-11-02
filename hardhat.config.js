require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-waffle");
const projectId = '69d46ccd33a143149616cf645717f896'
const fs = require('fs');

const privateKey = fs.readFileSync('.secret').toString()

module.exports = {
  networks: {
    hardhat: {
      chainId: 1337
    },
    mumbai: {
      url: `https://polygon-mumbai.infura.io/v3/${projectId}`,
      accounts: [privateKey],
    },
    mainnet: {
      url: `https://polygon-mainnet.infura.io/v3/${projectId}`,
      accounts: [privateKey],
    }
  },
  solidity: "0.8.4",
};
