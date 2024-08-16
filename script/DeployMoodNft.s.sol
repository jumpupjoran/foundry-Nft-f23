// SPDX-License_Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {MoodNft} from "../src/MoodNft.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodNft is Script {
    function run() public returns (MoodNft) {
        string memory sadSvg = vm.readFile("./img/sad.svg");
        string memory happySvg = vm.readFile("./img/happy.svg");

        vm.startBroadcast();
        MoodNft moodNft = new MoodNft(
            svgToImageURI(happySvg),
            svgToImageURI(sadSvg)
        );

        vm.stopBroadcast();
        return moodNft;
    }

    function svgToImageURI(
        string memory svg
    ) public pure returns (string memory) {
        // wa have to define the base64 prefix
        string memory baseURL = "data:image/svg+xml;base64,";
        // we have to encode the svg string to base64
        string memory svgBase64Encoded = Base64.encode(
            bytes(string(abi.encodePacked(svg)))
        );
        // we have to concatenate/put together the base64 prefix with the encoded svg
        return string(abi.encodePacked(baseURL, svgBase64Encoded));
    }
}
