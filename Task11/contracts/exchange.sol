// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Exchange is Ownable {
    uint256 public constant PRECISION = 1e18;
    uint256 public exchangeRate; // Ratio: token2 per token1 * PRECISION
    IERC20 public token1;
    IERC20 public token2;

    event ExchangeExecuted(address indexed user, uint256 token1Amount, uint256 token2Amount);
    event ExchangeRateUpdated(uint256 newRate);

    constructor(address _token1, address _token2, uint256 _exchangeRate) Ownable(msg.sender) {
        token1 = IERC20(_token1);
        token2 = IERC20(_token2);
        exchangeRate = _exchangeRate;
    }

    function updateExchangeRate(uint256 _newRate) external onlyOwner {
        exchangeRate = _newRate;
        emit ExchangeRateUpdated(_newRate);
    }

    function exchange(uint256 token1Amount) external returns (uint256 token2Amount) {
        require(token1Amount > 0, "Amount must be greater than 0");

        unchecked {
            token2Amount = (token1Amount * exchangeRate) / PRECISION;
        }

        require(token2.balanceOf(address(this)) >= token2Amount, "Insufficient liquidity");
        require(token1.transferFrom(msg.sender, address(this), token1Amount), "Token1 transfer failed");
        require(token2.transfer(msg.sender, token2Amount), "Token2 transfer failed");

        emit ExchangeExecuted(msg.sender, token1Amount, token2Amount);
        return token2Amount;
    }
}
