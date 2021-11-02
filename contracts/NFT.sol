// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// erc 721
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// ERC721URIStorage (inherits from erc 721)
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

// utils
import "@openzeppelin/contracts/utils/Counters.sol";

import "hardhat/console.sol";

contract NFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokensIds; // for minting incrementing
    address contractAddress; // market place address we gonna give ability to transact the tokens;

    constructor(address marketplaceAddress) ERC721("Metaverse Tokens", "METT") {
        contractAddress = marketplaceAddress;
    }

    function createToken(string memory tokenURI) public returns (uint256) {
        _tokensIds.increment();
        uint256 newItemId = _tokensIds.current();
        // minting
        _mint(msg.sender, newItemId);
        //
        _setTokenURI(newItemId, tokenURI);
        // give the marketplace approvel to transcat this token between users
        setApprovalForAll(contractAddress, true);
        return newItemId;
    }
}
