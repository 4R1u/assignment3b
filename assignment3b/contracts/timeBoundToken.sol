// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract timeBoundToken{
    ERC20 private _token;
    address private _buyer;
    uint256 private _secsBeforeTransfer;
    constructor (ERC20 token, address buyer, uint256 secsBeforeTransfer) public {
        require(secsBeforeTransfer > block.timestamp, "timeBoundToken: can not be released yet");
        _token = token;
        _buyer = buyer;
        _secsBeforeTransfer = secsBeforeTransfer;
    }
    function release() public virtual {
        require(block.timestamp >= _secsBeforeTransfer, "TokenTimelock: current time is before release time");
        uint256 amount = _token.balanceOf(address(this));
        require(amount > 0, "TokenTimelock: no tokens to release");
        _token.transfer(_buyer, amount);
    }
}