//SPDX-License-Identifier:MIT

pragma solidity ^0.8.24;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {BasicNft} from "../src/BasicNft.sol";


contract MintBasicNft is Script{
    string constant public PUG="ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";
    function run() external{
        address mostRecentlyDeployed= DevOpsTools.get_most_recent_deployment(
            "BasicNft", block.chainid
        );
        //address mostRecentlyDeployed= 0x93129a69cb7b7f3C625475514D49532e8f356A4F;
        mintNftOnContract(mostRecentlyDeployed);
    }
    function mintNftOnContract(address contractAddress) public{
        vm.startBroadcast();
        BasicNft(contractAddress).mintNft(PUG);
        vm.stopBroadcast();
    }

}