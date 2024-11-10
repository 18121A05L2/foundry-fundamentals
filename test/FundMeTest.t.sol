//SPDX-License-Identifier : MIT

pragma solidity ^0.8;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";

contract FundeMeTest is Test {
    uint256 a = 10;
    FundMe fundMe;

    function setUp() external {
        // fundMe = new FundMe();
            console.log("sender in Test",msg.sender);
        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
        a = 30; 
    }

    function testHello() public view {
        console.log(a);
    }

    function testMinimumUsd() public view {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function checkTheOwner() public view {
        console.log("Owner : ",fundMe.getOwner());
        assertEq(fundMe.getOwner(),msg.sender);

    }
}
