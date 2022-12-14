// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {DefaultMetadataDecoder} from "../src/metadata/DefaultMetadataDecoder.sol";
import {ProvenanceRenderer} from "../src/metadata/ProvenanceRenderer.sol";
import {Publisher} from "../src/Publisher.sol";
import {AssemblyPress} from "../src/AssemblyPress.sol";
import {AssemblyPressProxy} from "../src/AssemblyPressProxy.sol";

contract AssemblyPressArch is Script {
    uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

    // address zoraNFTCreatorProxy = 0xF74B146ce44CC162b601deC3BE331784DB111DC1; // MAINNET
    address zoraNFTCreatorProxy = 0xb9583D05Ba9ba8f7F14CCEe3Da10D2bc0A72f519; // GOERLI

    address goerliOwner = vm.envAddress("GOERLI_OWNER");

    function setUp() public {}

    function run() public {
        vm.startBroadcast(deployerPrivateKey);

        // // Create an instance of Publisher
        // Publisher publisher = new Publisher();

        // // Create an instance of Assembly Press
        // AssemblyPress assemblyPress = new AssemblyPress(
        //     address(zoraNFTCreatorProxy),
        //     publisher
        // );

        // // Create a proxy of the Assembly Press instance
        // AssemblyPressProxy assemblyPressProxy = new AssemblyPressProxy(
        //     address(assemblyPress),
        //     goerliOwner
        // );

        // Create an instance of the Default Metadata Decoder
        new DefaultMetadataDecoder();

        // Create an instance of the ProvenanceRenderer
        new ProvenanceRenderer();

        vm.stopBroadcast();

        // console2.log("Publisher Impl: ", address(publisher));
        // console2.log("Assembly Press Impl: ", address(assemblyPress));
        // console2.log("Assembly Press Proxy: ", address(assemblyPressProxy));
    }
}

// ======= DEPLOY SCRIPTS =====

// $ source .env
// $ forge script script/AssemblyPressArch.s.sol:AssemblyPressArch --rpc-url $GOERLI_RPC_URL --broadcast --verify  -vvvv
// $ forge script script/AssemblyPressArch.s.sol:AssemblyPressArch --rpc-url $MAINNET_RPC_URL --broadcast --verify  -vvvv
