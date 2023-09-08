// SPDX-License-Identifier: GPL-3.0

// Define a versão do compilador solidity
pragma solidity ^0.8.0;

// Delara um contrato, semelhante a uma class
contract SolidityTest {
    constructor() {

    }
// Palavra reservada function, nome da função, escopo de visibilidade e o tipo de retorno
    function getResult() public pure returns(uint resultado) {
        uint a = 1;
        resultado = a * 2;
    }
}