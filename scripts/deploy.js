// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

// async function main() {
  


  

//   const Lock = await hre.ethers.getContractFactory("Dice");
//   const lock = await Lock.deploy();

//   await lock.deployed();

  
// }
const { ethers } = require('hardhat');

async function main() {
  // Deploying GLDToken contract
  const GLDToken = await ethers.getContractFactory('Dice');
  const initialSupply = 1000000; // Set the initial supply of tokens
  const gldToken = await GLDToken.deploy(initialSupply);
  await gldToken.deployed();

  console.log('GLDToken deployed to:', gldToken.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });


// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
// main().catch((error) => {
//   console.error(error);
//   process.exitCode = 1;
// });
