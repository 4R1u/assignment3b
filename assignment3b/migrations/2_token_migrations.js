const cappedToken = artifacts.require("cappedToken");
const timeBoundToken = artifacts.require("timeBoundToken");
module.exports = function(deployer,network,accounts) {
  deployer.deploy(timeBoundToken);
  deployer.deploy(cappedToken);
};
