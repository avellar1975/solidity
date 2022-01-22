# <img src='https://upload.wikimedia.org/wikipedia/commons/9/98/Solidity_logo.svg' width='20x20'> Solidity

## Carteira MetaMask

MetaMask é uma carteira de criptomoeda de software usada para interagir com o blockchain Ethereum. Ele permite que os usuários acessem sua carteira Ethereum por meio de uma extensão do navegador ou aplicativo móvel, que pode então ser usado para interagir com aplicativos descentralizados.

Site para criação da carteira https://metamask.io/

## Conectando o MetaMask à Binance Smart Chain

https://academy.binance.com/pt/articles/connecting-metamask-to-binance-smart-chain

Devemos clicar em Adicionar Rede (Add Network) no canto superior direito para adicionar manualmente a rede da Binance Smart Chain – que inicialmente, não vem integrada ao MetaMask. É importante notar que existem duas redes que podemos usar aqui: a testnet (rede de testes) ou a mainnet (rede principal). Abaixo estão os parâmetros que devem ser usados para cada uma.

**Mainnet** (esta é a que você provavelmente está procurando)
* REDE DE PRODUÇÃO
* Network Name: Smart Chain
* New RPC URL: https://bsc-dataseed.binance.org/
* ChainID: 56
* Symbol: BNB
* Block Explorer URL: https://bscscan.com

**Testnet**
* REDE DE TESTES (sem gastar dinheiro)
* Network Name: Smart Chain - Testnet
* New RPC URL: https://data-seed-prebsc-1-s1.binance.org:8545/
* ChainID: 97
* Symbol: BNB
* Block Explorer URL: https://testnet.bscscan.com

> Inserir os dados da rede na Carteira MetaMask

## EIP-20: Padrão de Token ERC-20

https://eips.ethereum.org/EIPS/eip-20


O EIP-20 é talvez um dos EIPs mais conhecidos no mundo de Ethereum, uma vez que foi criado para implementar o conhecido Token padrão ERC-20. Este desenvolvimento marcou o início para a Ethereum criar uma ferramenta padrão para implantar tokens em seu blockchain. Como resultado, Ethereum se tornou o blockchain com o maior número de tokens que existe hoje.

## BEP-20

https://academy.binance.com/en/glossary/bep-20

Binance Smart Chain tem um padrão de token BEP20 que funciona de forma semelhante ao padrão ERC20 da Ethereum. BEP20 é um padrão de token amigável ao desenvolvedor que permite a qualquer pessoa implantar moedas digitais fungíveis ou tokens no Binance Smart Chain. Além do mais, os principais ativos digitais em outras cadeias podem ser transferidos para a Binance Smart Chain na forma de tokens BEP20 indexados. Por exemplo, você pode usar a Binance Bridge para trocar bitcoin (BTC) por tokens BTCB (BEP20) garantidos por BTC. Os tokens BTCB (BEP20) podem então ser implantados em protocolos DeFi para ganhar rendimento em bitcoin. O mesmo vale para ETH, XRP, DOGE e muitos mais.

## Gerar crédito para Carteira criada

https://testnet.binance.org/faucet-smart

Consegue gerar um BNB a cada 24 horas (testes realizados em Jan/2022)


## IDE On-line Remix
https://remix.ethereum.org/

O ambiente de Deploy utilizado é o **Injected Web3**, isso vai fazer com que haja uma conexão com a carteira MetaMask.
