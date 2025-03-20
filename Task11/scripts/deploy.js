async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying contracts with account:", deployer.address);

  // Deploy TokenOne
  const TokenOne = await ethers.getContractFactory("contracts/TokenOne_Final.sol:TokenOne");
  const tokenOne = await TokenOne.deploy();
  await tokenOne.waitForDeployment();
  console.log("TokenOne deployed to:", tokenOne.target);

  // Deploy TokenTwo
  const TokenTwo = await ethers.getContractFactory("contracts/TokenTwo_Final.sol:TokenTwo");
  const tokenTwo = await TokenTwo.deploy();
  await tokenTwo.waitForDeployment();
  console.log("TokenTwo deployed to:", tokenTwo.target);

  // Deploy Exchange Contract with a small exchange rate
  const smallRate = ethers.parseUnits("0.00001", 18);
  const Exchange = await ethers.getContractFactory("contracts/exchange.sol:Exchange");
  const exchange = await Exchange.deploy(tokenOne.target, tokenTwo.target, smallRate);
  await exchange.waitForDeployment();
  console.log("Exchange contract deployed to:", exchange.target);
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
