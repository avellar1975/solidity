// SPDX-License-Identifier: GPL-3.0

// Define a versão do compilador solidity
pragma solidity ^0.8.0;

contract Types {

    uint[6] data;

    function array_exemplo() public returns (uint[6] memory){
        data = [uint(10), 20, 30, 40, 50, 60];

        return(data);
    }
}