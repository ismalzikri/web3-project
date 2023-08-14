import { ethers } from "hardhat";

async function main() {
  const PepeDoods = await ethers.getContractFactory("PepeDoods");

  const pepedoods = await PepeDoods.deploy(
    "ipfs://QmfT43AtZixD1A5X5ce859ZS3mvQaN2vKNFwP4DQrjngAK"
  );
  await pepedoods.deployed();

  console.log("Pepedoods deployed to:", pepedoods.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
