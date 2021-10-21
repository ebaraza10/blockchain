pragma solidity ^0.8.9;
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol';


contract CorruptionPreventionToken is ERC20{
    address admin;
    // Override the ERC20 constructor
    constructor() ERC20("Corruption Prevention Token", "CPT"){
        admin = msg.sender;
        _mint(admin, 10000 * 10 ** 18); // Initial token supply
    }
    
    function getAddress() external view returns (address){
        require(msg.sender == admin, 'Only admin can mint'); // Only the admin can call this function
        return address(this);
    }
    
    function mint(address to, uint amount) external{
        require(msg.sender == admin, 'Only admin can mint'); // Only the admin can mint tokens
        _mint(to, amount);
    }
    
    function burn(uint amount) external{
        // Any address can burn tokens
        _burn(msg.sender, amount);
    }
    
}