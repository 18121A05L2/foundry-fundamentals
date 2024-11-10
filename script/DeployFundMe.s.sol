// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

import {Script, console} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        console.log("sender in DeployFundMe", msg.sender);
        HelperConfig helperConfig = new HelperConfig();
        vm.startBroadcast();
        (address ethPriceUsd) = helperConfig.activeNetworkConfig();
        FundMe fundMe = new FundMe(ethPriceUsd);
        vm.stopBroadcast();
        return fundMe;
    }
}
