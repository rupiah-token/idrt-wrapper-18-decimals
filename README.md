# 18 Decimals Wrapper for IDRT #
This repo is created to cater 18 decimals requirement for some dapps such as [Sablier](https://www.sablier.finance/). 

`IDRTW` is a ERC20-compatible token where a corresponding [`IDRT ERC20`](https://etherscan.io/address/0x998ffe1e43facffb941dc337dd0468d52ba5b48a) is required to mint `IDRTW`, while burning will return its corresponding `IDRT` to the `IDRTW` burner address.

The contract requires user to approve/enable `IDRT` to be spent by this contract by calling `approve` function in `IDRT`.


Copyright © 2020, PT Rupiah Token Indonesia