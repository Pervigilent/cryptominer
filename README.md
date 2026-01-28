# cryptominer
Cryptocurrency miner

## Bitcoin
### Mining
Newly broadcast transactions are repeatedly verified and collected into a new group of transacations called block. Each block contains a cryptographic hash of the previous block, using the SHA-256 hashing algorithm.

A block must contain a proof-of-work called a nonce. When teh block content is hashed along with the nonce, the result is numerically smaller than the network difficulty target.

Every 2016 blocks, the difficulty target is adjusted (to approximately 10 minutes per block).

