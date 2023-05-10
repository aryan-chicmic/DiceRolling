pragma solidity ^0.8.9;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Dice is ERC20 {
    uint rNo = 0;

    // constructor() {
    //     getNumber();
    // }

    function setNumber() public returns (uint) {
        rNo++;
        return
            uint(keccak256(abi.encodePacked(msg.sender, block.timestamp, rNo)));
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
    // mapping(address => uint) public addressesOfSender;
    address[][] addressofSender;
    uint bettingAmount = 0;

    constructor(uint256 initialSupply, uint bet) ERC20("Gold", "GLD") {
        _mint(msg.sender, initialSupply);
        bettingAmount = bet;
        saveAddress(bet);
    }

    function saveAddress(uint bet) public {
        addressofSender.push([msg.sender][bet]);
    }

    function fetchBet(address betAddress) public view returns (uint) {
        return addressofSender[betAddress];
    }

    function testCalc() public {
        console.log(addressofSender);
    }

    function test() public view {
        console.log("Balance", balanceOf(msg.sender));
    }
}
