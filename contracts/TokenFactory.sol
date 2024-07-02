// contracts/TokenFactory.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./PiesCoin.sol";

contract TokenFactory {
    struct Token {
        string name;
        string symbol;
        address contractAddress;
    }
    
    Token[] public tokens;
    address public piesCoinAddress;

    constructor(address _piesCoinAddress) {
        piesCoinAddress = _piesCoinAddress;
    }

    function createToken(string memory name, string memory symbol, uint256 initialSupply) public {
        PiesCoin newToken = new PiesCoin(initialSupply);
        tokens.push(Token({
            name: name,
            symbol: symbol,
            contractAddress: address(newToken)
        }));
    }

    function getTokens() public view returns (Token[] memory) {
        return tokens;
    }
}
