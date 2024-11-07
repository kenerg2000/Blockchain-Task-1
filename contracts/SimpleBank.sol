pragma solidity ^0.8.0;

contract SimpleBank {
    // Mapping to track the balance of each address
    mapping(address => uint) public balances;

    // Deposit function: allows users to send Ether to the contract
    function deposit() public payable {
        require(msg.value > 0, "Must deposit some ether"); // Ensure they send more than 0
        balances[msg.sender] += msg.value; // Increase the balance for the sender's address
    }

    // Withdraw function: allows users to withdraw a specified amount of Ether
    function withdraw(uint amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance"); // Check the user has enough balance
        balances[msg.sender] -= amount; // Decrease the sender's balance
        payable(msg.sender).transfer(amount); // Send Ether to the user
    }
}