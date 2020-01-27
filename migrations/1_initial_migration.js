const Migrations = artifacts.require("Migrations");
const IDRTW = artifacts.require("IDRTW");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(IDRTW, "IDRT Wrapper", "IDRTW", 18, "0x998ffe1e43facffb941dc337dd0468d52ba5b48a");
};
