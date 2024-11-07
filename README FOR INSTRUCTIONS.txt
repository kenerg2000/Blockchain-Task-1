
1.get .env file and adjust it accordingly like we did in mark's lesson
2. Npm install dotenv 
3. check etherscan for sepolia: https://sepolia.etherscan.io/  ("0xc01ccE218d7F863933A5EF98029b78E8B13858d3") <- ContractAddress

npx hardhat console --network sepolia
const abi = require('./artifacts/contracts/SimpleBank.sol/SimpleBank.json').abi;
const contractAddress = "0xc01ccE218d7F863933A5EF98029b78E8B13858d3"; 
const contract = new ethers.Contract(contractAddress, abi, ethers.provider);
const [signer] = await ethers.getSigners();
const balance = await contract.balances(signer.address);
console.log(`Balance: ${ethers.formatEther(balance)} ETH`);
const contractWithSigner = new ethers.Contract(contractAddress, abi, signer);

const txDeposit = await contractWithSigner.deposit({ value: ethers.parseEther("0.01") });
await txDeposit.wait(); // Wait for the transaction to be mined

const newBalance = await contract.balances(signer.address);
console.log(`Updated Balance: ${ethers.formatEther(newBalance)} ETH`);

const txWithdraw = await contractWithSigner.withdraw(ethers.parseEther("0.005"));
await txWithdraw.wait(); // Wait for the transaction to complete

const finalBalance = await contract.balances(signer.address);
console.log(`Final Balance: ${ethers.formatEther(finalBalance)} ETH`);

Adjust the withdraw and deposit values to your liking.


