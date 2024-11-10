//SPDX-License-Identifier: MIT

pragma solidity ^0.8;

import {Script} from "forge-std/Script.sol";

contract HelperConfig {
    struct NetworkConfig {
        address priceFeed;
    }

    NetworkConfig public activeNetworkConfig;

    constructor() {
        if (block.chainid == 11155111) {
            activeNetworkConfig = getSepoliaEthConfig();
        }
    }

    function getSepoliaEthConfig() public pure returns (NetworkConfig memory) {
        NetworkConfig memory networkConfig = NetworkConfig({priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306});
        return networkConfig;
    }

    function getAnvilEthConfig() public pure returns (NetworkConfig memory) {}
}
