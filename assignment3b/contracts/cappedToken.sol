// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
abstract contract cappedToken is ERC20{
    uint256 _cap;
    constructor (uint256 cap) {
        require(cap > 0, "ERC20Capped: cap is 0");
        _cap = cap;
    }
    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual override {
        super._beforeTokenTransfer(from, to, amount);
        if (from == address(0)) {
            require(totalSupply() + amount <= _cap, "CappedToken: cap exceeded");
        }
    }
    function setCap(uint256 inputCap) public {
        _cap = inputCap;
    }
}
