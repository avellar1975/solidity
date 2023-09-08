// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Memory {
    
    int[] public numbers; // array de inteiros
    
    function getNumbers() public returns (int[] memory, int[] memory) {
        numbers.push(1); // insere valor 1 na posição 0 [1]
        numbers.push(2); // insere valor 2 na posição 1 [1, 2]

        int[] memory newNumbers = numbers; // Criar um novo array [1, 2]

        newNumbers[0] = 12; // altera para [12, 2]

        return (numbers, newNumbers); // retorna [1, 2] e [12, 2]

    }
}

