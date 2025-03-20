// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/// @title TokenOne - A standard ERC-20 token with fixed supply.
contract TokenOne is ERC20 {
    // The total supply is set once at deployment.
    constructor(uint256 initialSupply) ERC20("TokenOne", "TK1") {
        _mint(msg.sender, initialSupply);
    }
}

/// @title TokenTwo - Another standard ERC-20 token with fixed supply.
contract TokenTwo is ERC20 {
    constructor(uint256 initialSupply) ERC20("TokenTwo", "TK2") {
        _mint(msg.sender, initialSupply);
    }
}
