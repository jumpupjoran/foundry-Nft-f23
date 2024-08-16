// SPDX-License_Identifier: MIT

import {Script} from "forge-std/Script.sol";
import {BasicNft} from "../src/BasicNft.sol";

pragma solidity ^0.8.18;

contract DeployBasicNft is Script {
    function run() public returns (BasicNft) {
        vm.startBroadcast();
        BasicNft basicNft = new BasicNft();
        vm.stopBroadcast();
        return basicNft;
    }
}
