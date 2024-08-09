# Fusion - Circuits

![Made-With-Noir](https://img.shields.io/badge/MADE%20WITH-NOIR-f2c2b6.svg?colorA=222222&style=for-the-badge&logoWidth=14)

> Fusion is a multi-chain smart contract wallet that leverages zero-knowledge proofs for cross-chain deployments and authentication.

> **Pre-requisites:**
>
> - Setup Nargo (recommended via [nargo](https://noir-lang.org/docs/getting_started/installation/))
> - Install [Noir](https://noir-lang.org/docs/getting_started/installation/)
> - Clone this repository

#

# Circuits

## oracle_prove

Oracle_prove circuit is used to verify the ECDSA signature through RPC Call to the server. If verified, server provides a secret based on the key which is then hashed to verify the credentials with the contract.

|    **Inputs**     | **Type** | **Size** | **Visibility** |
| :---------------: | -------- | :------: | :------------: |
|     pub_key_x     | Field[]  |    32    |    private     |
|     pub_key_y     | Field[]  |    32    |    private     |
|     signature     | u8[]     |    64    |    private     |
|  hashed_message   | u8[]     |    32    |    private     |
|      tx_Hash      | Field    |    1     |     public     |
| verifying_address | Field    |    1     |     public     |
|  signing_address  | Field    |    1     |     public     |

## deploy_prove

Deploy_prove circuit is used to verify the payload is from the server.

|   **Inputs**    | **Type** | **Size** | **Visibility** |
| :-------------: | -------- | :------: | :------------: |
|    reqDomain    | Field    |    1     |    private     |
|    passcode     | Field    |    1     |    private     |
|   serverHash    | Field    |    1     |     public     |
|     domain      | Field    |    1     |     public     |
|    chaindId     | Field    |    1     |     public     |
| signing_address | Field    |    1     |     public     |
| proving_address | Field    |    1     |     public     |

## credit_prove

Credit_prove circuit is used to verify the credit and debit of Gas credits

|   **Inputs**    | **Type** | **Size** | **Visibility** |
| :-------------: | -------- | :------: | :------------: |
|    reqDomain    | Field    |    1     |    private     |
|    passcode     | Field    |    1     |    private     |
|   serverHash    | Field    |    1     |     public     |
|     domain      | Field    |    1     |     public     |
|    chaindId     | Field    |    1     |     public     |
|     txHash      | u8       |    32    |     public     |
|     amount      | Field    |    1     |     public     |
|     tx_type     | Field    |    1     |     public     |
| proving_address | Field    |    1     |     public     |

## p2_hash_2

Helper function to hash inputs

| **Inputs** | **Type** | **Size** | **Visibility** |
| :--------: | -------- | :------: | :------------: |
|   inputs   | Field[]  |    2     |    private     |
|  returns   | Field    |    1     |     public     |

## p2_hash_64

Helper function to hash inputs

| **Inputs** | **Type** | **Size** | **Visibility** |
| :--------: | -------- | :------: | :------------: |
|   inputs   | Field[]  |    65    |    private     |
|  returns   | Field    |    1     |     public     |

# Testing and Deployment

```bash
# Executing deploy_prove circuit
cd deploy_prove
nargo execute

# Checking constraints
nargo info

# Testing circuits
nargo check

# Generate zk-proof
nargo prove

# generate Solidity Verifier
nargo codegen-verifier
```
