// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TokenOne is ERC20, Ownable {
    constructor() ERC20("TokenOne", "TK1") Ownable(msg.sender) {
        _mint(msg.sender, 1000 * 10**18); // Fixed supply of 1000 TK1 tokens
    }
}
