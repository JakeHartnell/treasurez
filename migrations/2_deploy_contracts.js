var TreasureHunt = artifacts.require("TreasureHunt");
module.exports = function(deployer) {
  deployer.deploy(TreasureHunt, "i like dogs", {
    oasis: { confidential: true }
  });
};
