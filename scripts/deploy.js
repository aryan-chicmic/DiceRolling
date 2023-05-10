const { ethers } = require('hardhat');

async function main() {
  // Deploying Dice contract
  const Dice = await ethers.getContractFactory('Dice');
  const initialSupply = 1000000; // Set the initial supply of tokens
  const bettingAmount = 10; // Set the initial betting amount
  const dice = await Dice.deploy(initialSupply, bettingAmount);
  await dice.deployed();

  console.log('Dice deployed to:', dice.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
