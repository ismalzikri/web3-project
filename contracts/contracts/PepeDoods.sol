//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/access/Ownable.sol';
import '@openzeppelin/contracts/security/Pausable.sol';
import '@openzeppelin/contracts/security/ReentrancyGuard.sol';
import '@openzeppelin/contracts/utils/math/Math.sol';
import './lib/ERC721Lite.sol';
import './lib/Allowlist.sol';

contract PepeDoods is ERC721Lite, Allowlist, Ownable, ReentrancyGuard {
  uint private constant MAX_SUPPLY = 5000;
  uint private constant MAX_PER_TX = 20;

  // Metadata
  string internal _tokenURI;

  // Pricing and Withdraw
  uint256 public price = 0.04 ether;
  uint256 public wlPrice = 0.02 ether;
  address payable public receiver;

  constructor(
    string memory __tokenURI
  ) ERC721Lite('PepeDoods', 'PEPE', MAX_PER_TX) {
    _tokenURI = __tokenURI;
    receiver = payable(msg.sender);
  }

  modifier canMint(uint amount) {
    require(amount > 0, 'amount too little');
    require(totalSupply() + amount <= MAX_SUPPLY, 'exceed max supply');
    _;
  }

  function whitelistMint(
    uint amount,
    bytes32[] calldata _proof
  ) external payable nonReentrant canMint(amount) {
    require(isAllowed(_proof, msg.sender), 'not allowed');
    require(amount < 3, "amount can't exceed 2");
    require(msg.value == wlPrice * amount, 'insufficient fund');
    claimed[msg.sender] += amount;

    _safeMint(msg.sender, amount);
  }

  function mint(uint amount) external payable nonReentrant canMint(amount) {
    require(amount < MAX_PER_TX + 1, "amount can't exceed 20");
    require(msg.value == price * amount, 'insufficient fund');

    _safeMint(msg.sender, amount);
  }

  // Metadata
  function tokenURI(
    uint256 _tokenId
  ) public view override returns (string memory) {
    return
      string(
        abi.encodePacked(_tokenURI, '/', Strings.toString(_tokenId), '.json')
      );
  }
}
