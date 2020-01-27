pragma solidity ^0.5.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";

contract IDRTW is ERC20 {
    string internal _name;
    string internal _symbol;
    uint8 internal _decimals;
    ERC20Detailed internal _erc20;

    constructor(string memory name, string memory symbol, uint8 decimals, address erc20) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
        _erc20 = ERC20Detailed(erc20);
    }

    /**
     * @notice Mint IDRT 18 Decimals from IDRT
     * @dev Lock IDRT in this contract, and emit IDRT 18 Decimals
     * @param amount, amount to mint (in term of original IDRT)
     * @return bool
     */
    function mint(uint amount) public returns (bool) {
        require(_erc20.allowance(_msgSender(), address(this)) >= amount, "IDRTW: Please approve contract to spend IDRT first.");
        uint appendDecimals = uint(_decimals).sub(uint(_erc20.decimals()));

        _mint(_msgSender(), amount.mul( 10 ** appendDecimals ));

        _erc20.transferFrom(_msgSender(), address(this), amount);
        return true;
    }

    /**
     * @notice Burn IDRT 18 Decimals to IDRT
     * @dev Burn IDRT 18 Decimals and send IDRT to msg.sender
     * @param amount, amount to burn (in term of original IDRT)
     * @return bool
     */
    function burn(uint amount) public returns (bool) {
        uint appendDecimals = uint(_decimals).sub(uint(_erc20.decimals()));

        _burn(_msgSender(), amount.mul( 10 ** appendDecimals ));

        _erc20.transfer(_msgSender(), amount);
        return true;
    }


    /**
     * @dev Returns the corresponding token for IDRTW
     * name.
     */
    function erc20() public view returns (address) {
        return address(_erc20);
    }

    /**
     * @dev Returns the name of the token.
     */
    function name() public view returns (string memory) {
        return _name;
    }

    /**
     * @dev Returns the symbol of the token, usually a shorter version of the
     * name.
     */
    function symbol() public view returns (string memory) {
        return _symbol;
    }

    /**
     * @dev Returns the number of decimals used to get its user representation.
     * For example, if `decimals` equals `2`, a balance of `505` tokens should
     * be displayed to a user as `5,05` (`505 / 10 ** 2`).
     *
     * Tokens usually opt for a value of 18, imitating the relationship between
     * Ether and Wei.
     *
     * NOTE: This information is only used for _display_ purposes: it in
     * no way affects any of the arithmetic of the contract, including
     * {IERC20-balanceOf} and {IERC20-transfer}.
     */
    function decimals() public view returns (uint8) {
        return _decimals;
    }
}