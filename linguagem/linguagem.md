# Solidity

Solidity é uma linguagem de alto nível orientada a objetos para implementação de contratos inteligentes. Contratos inteligentes são programas que regem o comportamento das contas no estado Ethereum.

Todos os identificadores (contract names, function names and variable names) são restritos para caracteres ASCII. 

É possível armazenar dados codificados em UTF-8 em variáveis ​​string.

# Variáveis no Solidity

* Tipagem estática, o tipo da variável de estado ou local deve ser especificado durante a declaração.
* O conceito de valores “indefinidos” ou “nulos” não existe no Solidity, mas variáveis recém-declaradas sempre têm um valor padrão dependente de seu tipo.

## Tipos de dados primitivos

* bool (true/false)
* Integers
  * int/uint (interiros, com e sem sinal, de tamanhos variáveis)
  * int8 to int256 (com sinal de 8 bits a 256 bits)
  * uint8 to uint256 (sem sinal de 8 bits a 256 bits)
* Fixed Point Numbers
  * fixed/unfixed (Fixed point number)
  * fixedMxN (M representa o número de bits tomados pelo tipo e N representa os pontos decimais)
  * ufixedMxN (fixedMxN sem sinal)
* address (endereços na Ehereum: tx, sender, contract)
* string


O int253 é o mesmo que int, e o uint256 é o mesmo que uint.

> [!WARNING]
> 
> Os números de pontos fixos ainda não são totalmente suportados pelo Solidity.

### Booleans

Operadores booleanos:

* ! (logical negation)
* && (logical conjunction, “and”)
* || (logical disjunction, “or”)
* == (equality)
* != (inequality)

## Tipos de dados complexos

* Arrays
* Structs
* Byte array (fixed)
* Byte array (dinamic)
* Enum
* Mapping

### Array

É uma estrutura de dados, que armazena uma coleção sequencial de tamanho fixo de **elementos de mesmo tipo**.

São declarados da seguinte forma:

```type arrayName [ arraySize ];```

```uint balance [ 10 ];```

Inicializando arrays:

```uint balance[3] = [1, 2, 3];```

```uint balance[ ] = [1, 2, 3];```

Para arrays dinâmicos, utiliza-se a chave new:

```uint size= 3;```

```uint balance[] = new uint[](size);```

Para acessar elementos:

```uint salary = balance[2];```

Propriedades:

* Length: tamanho do array
* Push: permite anexar um elemento a um array de armazenamento dinâmico no final, retornando o novo comprimento do array.

### Structs

Tipos que armazenam registros e dados, de uma forma que lembra objetos em POO.

Sintaxe:

```
struct struct_name {
    type1 type_name_1;
    type2 type_name_2;
    type3 type_name_3;
}

// Exemplo:
struct Book {
    string title;
    string author;
    uint book_id;
}
```

Para acessar:

```book.book_id```

### Byte array (fixed)

Matrizes de bytes de tamanho fixo têm um comprimento especificado, variando de 1 a 32 bytes. A notação “bytesN” é usada para representar esses arrays, onde “N” é um número inteiro que representa o comprimento do array. Essas matrizes são úteis quando você sabe o tamanho exato dos dados com os quais está trabalhando.

```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FixedSizeBytesExample {
	// Store a fixed-size byte array
	bytes32 public fixedData;

	// Set the fixed-size byte array
	function setFixedData(bytes32 _data) public {
		fixedData = _data;
	}

	// Get the length of the fixed-size byte array
	function getFixedDataLength() public view returns (uint256) {
		return fixedData.length; // Always returns 32 for bytes32
	}
}

// Example usage:
// setFixedData input: 0x74657374696e67206461746120666f722062797465733332
// getFixedDataLength output: 32

```

* A entrada para a função setFixedData é um valor bytes32 codificado em hexadecimal: 0x74657374696e67206461746120666f722062797465733332. Quando convertido em uma string legível por humanos, representa “dados de teste para bytes32”. Observe que essa string tem 22 caracteres, mas é armazenada em um espaço de 32 bytes com preenchimento extra (espaços ou zeros) no final.

* Quando você chama a função getFixedDataLength, ela retorna o comprimento da matriz bytes32, que é sempre 32 bytes.


### Byte array (dinamic)

Matrizes de bytes dinâmicas não possuem comprimento fixo e seu tamanho pode ser alterado durante o tempo de execução. Essas matrizes são simplesmente representadas pela palavra-chave “bytes”.

```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DynamicBytesExample {
	// Store a dynamic byte array
	bytes public dynamicData;

	// Set the dynamic byte array
	function setDynamicData(bytes calldata _data) public {
		dynamicData = _data;
	}

	// Get the length of the dynamic byte array
	function getDynamicDataLength() public view returns (uint256) {
		return dynamicData.length;
	}
}

// Example usage:
// setDynamicData input: 0x74657374696e67206461746120666f722064796e616d6963206279746573
// dynamicData output: "testing data for dynamic bytes"
// getDynamicDataLength output: 30


```
* A entrada para a função setDynamicData é um valor de bytes dinâmicos codificados em hexadecimal: 0x74657374696e67206461746120666f722064796e616d6963206279746573. Quando convertido em uma string legível por humanos, representa “dados de teste para bytes dinâmicos”. Essa string tem 30 caracteres e é armazenada em uma matriz de bytes dinâmica que ajusta seu tamanho de acordo.

* Quando você consulta a variável dynamicData, a saída são os dados armazenados: “testando dados para bytes dinâmicos”.

* Quando você chama a função getDynamicDataLength, ela retorna o comprimento da matriz de bytes dinâmicos, que neste caso é de 30 bytes (o comprimento da string de entrada).


### Enum

Enums são a forma de criar tipos de dados definidos pelo usuário, geralmente são usados ​​para fornecer nomes para constantes integrais, o que torna o contrato melhor para manutenção e leitura. Enums restringem a variável com um dos poucos valores predefinidos, esses valores da lista enumerada são chamados enums . As opções são representadas com valores inteiros começando em zero; um valor padrão também pode ser fornecido para a enumeração. Ao usar enums é possível reduzir os bugs no código.

* Sintaxe:
  
```
enum <nome_enumerador> {
            elemento 1, elemento 2,....,elemento n
}
```

* Exemplo:

```
// Solidity program to demonstrate how to use 'enumerator'
pragma solidity ^0.5.0;

// Creating a contract
contract Types {

	// Creating an enumerator
	enum week_days
	{
	    Monday,
	    Tuesday,
	    Wednesday,
	    Thursday,
	    Friday,
	    Saturday,
	    Sunday
	}

	// Declaring variables of type enumerator
	
    week_days week;
	
	week_days choice;

	// Setting a default value
	
    week_days constant default_value = week_days.Sunday;
	
	// Defining a function to set value of choice
	
    function set_value() public {
	    choice = week_days.Thursday;
	}

	// Defining a function to return value of choice
	
    function get_choice() public view returns (week_days) {
	    return choice;
	}
	
	// Defining function to return default value
	
    function getdefaultvalue() public pure returns(week_days) {
		return default_value;
	}
}

```


### Mapping

O mapeamento no Solidity funciona como uma tabela hash ou dicionário em qualquer outro idioma. Eles são usados ​​para armazenar os dados na forma de pares de chave-valor. Uma chave pode ser qualquer um dos tipos de dados integrados, mas os tipos de referência não são permitidos, enquanto o valor pode ser de qualquer tipo. Os mapeamentos são usados ​​principalmente para associar o endereço Ethereum exclusivo ao tipo de valor associado.

* Sintaxe

```mapping(key => value) <access specifier> <name>;```

* Exemplo:

```
// Solidity program to demonstrate mapping
pragma solidity ^0.4.18;

// Defining contract 
contract mapping_example {
	
	//Defining structure
	struct student
	{
		// Declaring different structure elements
		string name;
		string subject;
		uint8 marks;
	}
	
	// Creating a mapping
	mapping (address => student) result;
	address[] public student_result;
}

```

## Tipos de variáveis

* Estado
* Memory -> análogo Memória RAM
* Storage -> análogo Disco rígido
* Locais
* Globais

### Variáveis de Estado

Valores são armazenados permanentemente em um armazenamento (storage) de um contrato.


* Exemplo:

```

uint storedData; // Declarando uma variável de estado

contract SolidityTest {    
    constructor() public{
        storedData = 10 // Utilizando uma variável de estado
    }

    function getResult() public view returns (unint) {
        uint a = 1;
        return storedData; // Acessano uma variável de estado dentro da função
    }
}

```

### Memory vs Storage

**Memory** no Solidity se refere a um armazenamento temporário enquanto **Storage** trata de preservar os dados entre **chamadas de funções**.

**Storage** é persistente e cada execução do Smart Contract tem acesso aos dados anteriormente armazenados.

O consumo de **gas** de um **Memory** não é alto se comparado ao do **Storage**.

Boa prática: Memory para cálculos intermediários e Storage para armazenamento final do resultado. Ou seja o Storage registra o resultado na blockchain.

Variáveis de estado, locais, structs e arrays são sempre armazenadas como Storage.

Argumentos de funções são sempre armazenadas como Memory.


### Variáveis locais

Variáveis cujos valores estão disponíveis apenas dentro e uma função onde ela está definida.

Os parâmetros da função são sempre locais para essa função.

* Exemplo:

```
contract SolidityTest {  

    constructor() public{

    }

    function getResult() public view returns (unint) {
        uint a = 1;             // declarando uma variável local
        uint result = a * 2;    // declarando uma variável local
        return result;
    }
}

```

### Variáveis globais

Variáveis especiais que existem na workspace global e fornecem informações sobre o blockchain e as propriedades de uma transação.

* blockhash (uint blockNumber) returns (bytes32) - hash de um determinado bloco
* block.coinbase (address payable) - Bloco do atual minerador do bloco
* block.gaslimit (uint) - dificuldade de mineração do bloco atual
* block.number (uint) - número do bloco atual
* block.timestamp (uint) - carimbo de tempo do bloco
* gasleft() returns (uint256) - Gas restante
* msg.data (bytes calldata) - Dados
* msg.sender (address payable) - remetente da transação
* msg.sig (bytes4) - identificador da função
* msg.value (uint) - valor da transação (Wei)
* now (uint) - timestamp atual do bloco
* tx.gasprice (uint) - custo da transação
* tx.origin (adress payable) - endereço da origem da transação

## Nomenclatura de variáveis
* Não usar palavras reservadas
* Não podem iniciar com números
* Case-sensitive

## Escopo de variáveis
  
* **Public**: podem ser acessadas internamente, bem como por meio de mensagens. Uma função getter é automaticamente gerada.
* **Internal**: podem ser acessadas apenas internamente a partir do contrato atual ou do contrato derivado dele sem utilizá-lo.
* **Private**: podem ser acessadas apenas internamente a partir do contrato atual onde são definidads, e não são acessíveis no contrato derivado dele.

# Métodos no Solidity

Os métodos de classes são tratados como funções , sendo blocos de códigos reutilizáveis.

## Definição de função

* palavra-chave function
* nome exclusivo
* lista de parâmetros que podem ser vazios dentro de parênteses
* blocos de instrução entre chaves

## Anatomia de uma função


```function name(uint x, uint y) public view returns (uint, uint) {}```
* function - palavra-chave que define que é uma função
* name - nome da função, precisa ser único no contrato
* Dois parâmetros (podem ser nenhum, um ou vários parâmetros):
  * uint x - tido de dado e variável x
  * uint y - tido de dado e variável y
* public - indica que a função é visível para outros contratos (visibilidade - escopo)
* view - indica o comportamento da função 
* returns - retorno da função
* (uint, uint) - na saída serão dois valores do tipo uint
* {} - o corpo da função ficará entre as chaves

## Sintaxe de uma funçaõ

```
contract SolidityTest {  

    constructor() public{

    }

    function getResult() public view returns (unint) {
        uint a = 1;             
        uint result = a * 2;    
        return result;
    }
}

```

## Chamando uma função

Para chamar uma função basta chamar o nome da função dento do código

```uint res = getResult();```


## Modificadores de funções
> Comportamentos

Modificadores são códigos que podem ser rodados antes e/ou depois de chamar uma função.

Modificadores podem ser utilizados para::

* Restrição de acessos
* Validação de entradas
* Proteção contra hacks de reentrada

O corpo da função é inserido onde o símbolo especial "_;" aparece na definição de um modificador. 

Caso a **condição** do modificador seja satisfeita ao chamar uma função, a função será executada e, caso contrário, uma **exceção** será lançada.


```
contract Owner {  

    modifier onlyOwner {
        require(msg.sender == owner); // o remetente tem que ser dono do contrato
        _;
    }

    function abort() onlyOwner { // uso do modificador
        // ...
    }
}

```

## Funções View

São funçoes de visualização (**view**) de somente leitura, o que garante que as variáveis de estado não possam ser modificadas após chamá-las.

Se as instruções que modificam variáveis de estado, o compilador lança um **warning** em tais casos.

Por padrão, um método **get** é a função **view**.


```
// Variáveis de estado

uint num1 = 10;
uint num2 = 16;


    function getResult() public view returns (unint product, uint sum) {
        product = num1 * num2;             
        sum = num1 + num2;    
    }

```

## Funções Pure

As funções puras (**pure**) não leem nem modificam as variáveis de estado, retornando os valores apenas utilizando os parâmetros passados para a função ou variáveis locais presentes nela.


```
function getResult() public pure returns (unint product, uint sum) {
       uint num1 = 2; // locais
       uint num2 = 4; // locais   
       product = num1 * num2;             
       sum = num1 + num2;    
    }

```

## Ordem das Funções

A ordenação ajuda os leitores a identificar quais funções eles podem chamar e a encontrar mais facilmente as definições de construtor e substituto. 

As funções devem ser agrupadas de acordo com a sua visibilidade e ordenadas:

* constructor
* receive function (if exists)
* fallback function (if exists)
* external
* public
* internal
* private


# Bibliotecas

Uma biblioteca possui funções que podem ser chamadas  por outros contratos

A implantação de um código comum criando uma biblioteca reduz o custo do **gas**.

Exemplo:

* importando

```import <libraryName> from "./library-file.sol"```

* usando

```<libraryName> for <dataType>```

``` 
import "@openzeppelin/contracts/utils/EnumerableSet.sol";
import "./utils/Strings28ytes32.sol";

contract    {
    using EnumerableSet for EnumerableSet.Bytes32Set;
    using EnumerableSet for EnumerableSet.AddressSet;
    using Strings28ytes32 for string;
}

```

## Escrevendo Bibliotecas

``` 
library <libraryName> {

    // bloco de código
}

```

## Benefícios

* Reutilização de código
* Padronização
* Otimização
* Segurança
* Auditoria
