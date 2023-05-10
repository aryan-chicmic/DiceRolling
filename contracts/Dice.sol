
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import the ERC20 token contract from OpenZeppelin
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Dice is ERC20 {
    uint256 private rNo = 0;
    uint256 public bettingAmount;

    event GameResult(address player, uint256 prediction, uint256 randomNumber, bool won);

    constructor(uint256 initialSupply, uint256 bet) ERC20("Gold", "GLD") {
        _mint(msg.sender, initialSupply);
        bettingAmount = bet;
    }

    function play(uint256 prediction) external {
        require(bettingAmount > 0, "Betting amount must be greater than zero.");

        // Transfer ERC20 tokens from the player to the contract
        transferFrom(msg.sender, address(this), bettingAmount);

        // Generate a random number using the setNumber function
        uint256 randomNumber = setNumber();

        // Compare the prediction with the random number
        bool won = (prediction == randomNumber);

        // Emit the game result
        emit GameResult(msg.sender, prediction, randomNumber, won);

        // Transfer tokens back to the player if they won
        if (won) {
            transfer(msg.sender, bettingAmount);
        }
    }

    function setNumber() private returns (uint256) {
        rNo++;
        return uint256(keccak256(abi.encodePacked(msg.sender, block.timestamp, rNo)));
    }
}






 // function getNumber() public {
    //     console.log("msgSender", msg.sender);
    //     console.log("block timestamp", block.timestamp);
    //     console.log("blockNumber", block.number);
    //     // console.log("blockhash", blockhash((block.number) - 1));
    //     // console.log("blockhash", blockhash((block.number) - 1));
    //     uint numberGenerated = setNumber() % 6;
    //     console.log("random", numberGenerated + 1);
    // }