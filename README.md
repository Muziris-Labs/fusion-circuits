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

## shamir_generate_2_3

Shamir_generate_2_3 circuit is used to generate a 2-of-3 Shamir secret sharing scheme.

| **Inputs** | **Type** | **Size** | **Visibility** |
| :--------: | -------- | :------: | :------------: |
|   secret   | u64[]    |    32    |    private     |
|     a1     | u64[]    |    32    |    private     |
|  returns   | Share[]  |    3     |     public     |

## shamir_reconstruct_2_3

Shamir_reconstruct_2_3 circuit is used to reconstruct a 2-of-3 Shamir secret sharing scheme.

| **Inputs** | **Type** | **Size** | **Visibility** |
| :--------: | -------- | :------: | :------------: |
|   share    | Share[]  |    2     |    private     |
|  returns   | Field    |    32    |     public     |

## shamir_prove

Shamir_prove circuit is used to prove the correctness of the Shamir secret sharing scheme with the hash of the reconstructed secret.

|    **Inputs**     | **Type** | **Size** | **Visibility** |
| :---------------: | -------- | :------: | :------------: |
|      shares       | Share[]  |    2     |    private     |
|      message      | u8[]     |    32    |    private     |
|       hash        | Field    |    1     |     public     |
| verifying_address | Field    |    1     |     public     |
|  signing_address  | Field    |    1     |     public     |

## p2_hash_32

Helper function to hash inputs

| **Inputs** | **Type** | **Size** | **Visibility** |
| :--------: | -------- | :------: | :------------: |
|   inputs   | Field[]  |    32    |    private     |
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
