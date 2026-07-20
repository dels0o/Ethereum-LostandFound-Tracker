// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {LostAndFound} from "../src/LostAndFound.sol";

contract DeployLostAndFound is Script {

    function run() external returns (LostAndFound) {

        vm.startBroadcast();

        LostAndFound lostAndFound = new LostAndFound();

        vm.stopBroadcast();

        return lostAndFound;
    }
}
