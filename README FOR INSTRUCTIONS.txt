
1.get .env file and adjust it accordingly like we did in mark's lesson
2. Npm install dotenv 
3. check etherscan for sepolia: https://sepolia.etherscan.io/  ("0xc01ccE218d7F863933A5EF98029b78E8B13858d3") <- ContractAddress
Use following Commands
1. npx hardhat console --network sepolia
2. const abi = require('./artifacts/contracts/SimpleBank.sol/SimpleBank.json').abi;
3. const contractAddress = "0xc01ccE218d7F863933A5EF98029b78E8B13858d3"; 
4. const contract = new ethers.Contract(contractAddress, abi, ethers.provider);
5. const [signer] = await ethers.getSigners();
6. const balance = await contract.balances(signer.address);
7. console.log(`Balance: ${ethers.formatEther(balance)} ETH`);
8. const contractWithSigner = new ethers.Contract(contractAddress, abi, signer);

9. const txDeposit = await contractWithSigner.deposit({ value: ethers.parseEther("0.01") });
10. await txDeposit.wait(); // Wait for the transaction to be mined

11. const newBalance = await contract.balances(signer.address);
12. console.log(`Updated Balance: ${ethers.formatEther(newBalance)} ETH`);

13. const txWithdraw = await contractWithSigner.withdraw(ethers.parseEther("0.005"));
14. await txWithdraw.wait(); // Wait for the transaction to complete

15. const finalBalance = await contract.balances(signer.address);
16. console.log(`Final Balance: ${ethers.formatEther(finalBalance)} ETH`);

Adjust the withdraw and deposit values to your liking.


