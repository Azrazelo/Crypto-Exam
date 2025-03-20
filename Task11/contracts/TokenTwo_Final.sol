// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TokenTwo is ERC20, Ownable {
    constructor() ERC20("TokenTwo", "TK2") Ownable(msg.sender) {
        _mint(msg.sender, 1000 * 10**18); // Fixed supply of 1000 TK2 tokens
    }
}
