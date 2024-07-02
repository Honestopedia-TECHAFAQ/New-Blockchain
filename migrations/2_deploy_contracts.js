// migrations/2_deploy_contracts.js
const PiesCoin = artifacts.require("PiesCoin");
const TokenFactory = artifacts.require("TokenFactory");

module.exports = function(deployer) {
  deployer.deploy(PiesCoin, 1000000 * (10 ** 18)) // Initial supply of 1,000,000 tokens
    .then(() => {
      return deployer.deploy(TokenFactory, PiesCoin.address);
    });
};
