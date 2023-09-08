// SPDX-License-Identifier: GPL-3.0

// Define a versão do compilador solidity
pragma solidity ^0.8.0;


contract Teste {

struct Book {
    string title;
    string author;
    uint book_id;
}
Book book; // variavel do tipo Book

    function setBook() public {
        book = Book('Solidity for Dummys', 'DIO', 1);
    }
    function getBookTitle() public view returns (string memory) {
        return book.title;
    }
}