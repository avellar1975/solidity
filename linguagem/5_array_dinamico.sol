// SPDX-License-Identifier: GPL-3.0

// Define a versão do compilador solidity
pragma solidity ^0.8.0;

contract Types {

    int[] data; // Dinamico, pois não declaro quantos elementos ele vai ter.

    function array_exemplo() public returns (int[] memory){ // Dinamico, pois não declaro quantos elementos ele vai ter.
        data = [int(-10), 20, -30, 40, -50, 60, -140];
        data.push(200);
        return(data);
    }
}