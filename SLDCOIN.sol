
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SLDCOIN is ERC20, Ownable {
    uint256 public constant MAX_SUPPLY = 1_100_000 * 10**18; // 1.1 Million SLD
    uint256 public mintableAmount = 100_000 * 10**18; // 100K mintable when supply is low

    constructor() ERC20("SLDCOIN", "SLD") {
        _mint(msg.sender, 1_000_000 * 10**18); // Mint initial 1 Million SLD
    }

    function mint(address to, uint256 amount) external onlyOwner {
        require(totalSupply() + amount <= MAX_SUPPLY, "Exceeds max supply");
        _mint(to, amount);
    }

    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }
}