require("@nomicfoundation/hardhat-toolbox");
const INFURA_API_KEY = "e35502e4ccaf40cbbdc5a48db3fd3bbb";
const SEPOLIA_PRIVATE_KEY = "494e02bd70dc237d4c6302cc6377a1f4f166e714ad585a63a3325b532d22d244";

module.exports = {
  solidity: "0.8.18",
  networks: {
    hardhat: {},
    Sepolia: {
      url: `https://sepolia.infura.io/v3/${INFURA_API_KEY}`,
      accounts: [`0x${SEPOLIA_PRIVATE_KEY}`]
    }
  }
};
