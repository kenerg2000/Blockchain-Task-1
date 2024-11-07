const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("SimpleBankModule", (m) => {
  // Deploy the SimpleBank contract
  const simpleBank = m.contract("SimpleBank");

  return { simpleBank };
});