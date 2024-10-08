// SPDX-License_Identifier: MIT

import {Script} from "forge-std/Script.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {MoodNft} from "../src/MoodNft.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

pragma solidity ^0.8.18;

contract MintBasicNft is Script {
    string public constant PUG_URI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function run() external {
        address mostRecentlyDeployedBasicNft = DevOpsTools
            .get_most_recent_deployment("BasicNft", block.chainid);
        mintNftOnContract(mostRecentlyDeployedBasicNft);
    }

    function mintNftOnContract(address basicNftAddress) public {
        vm.startBroadcast();
        BasicNft(basicNftAddress).mintNft(PUG_URI);
        vm.stopBroadcast();
    }
}

contract MintMoodNft is Script {
    function run() external {
        address mostRecentlyDeployedMoodNft = DevOpsTools
            .get_most_recent_deployment("MoodNft", block.chainid);
        mintNftOnMoodNftContract(mostRecentlyDeployedMoodNft);
    }

    function mintNftOnMoodNftContract(
        address mostRecentlyDeployedMoodNft
    ) public {
        MoodNft(mostRecentlyDeployedMoodNft).mintNft();
    }

    function flipMoodOnMoodNftContract(
        address mostRecentlyDeployedMoodNft,
        uint256 tokenId
    ) public {
        MoodNft(mostRecentlyDeployedMoodNft).flipMood(tokenId);
    }
}
