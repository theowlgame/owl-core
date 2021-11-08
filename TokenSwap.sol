// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import "@openzeppelin/contracts-ethereum-package/contracts/access/Ownable.sol";
import "@openzeppelin/contracts-ethereum-package/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts-ethereum-package/contracts/token/ERC20/SafeERC20.sol";
import "@openzeppelin/contracts-ethereum-package/contracts/math/SafeMath.sol";
import "@openzeppelin/contracts-ethereum-package/contracts/math/Math.sol";

contract TokenSwap is OwnableUpgradeSafe {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    address public claimer;

    function initialize() public initializer {
        OwnableUpgradeSafe.__Ownable_init();
    }

    function Claim(IERC20 token) external {
        require(msg.sender == claimer, "no");
        uint256 bal = token.balanceOf(address(this));
        if(bal > 0)
            token.safeTransfer(msg.sender, bal);
    }

    function setClaimer(address _user) external onlyOwner {
        require(_user != address(0));
        claimer = _user;
    }

}
