require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config(); // Load environment variables

module.exports = {
  solidity: "0.8.20",
  networks: {
    sepolia: {
      url: process.env.SEPOLIA_RPC_URL, 
      accounts: [process.env.PRIVATE_KEY], // Your wallet private key
      chainId: 11155111, // Sepolia Testnet Chain ID
    },
  },
};
