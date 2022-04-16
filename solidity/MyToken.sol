pragma solidity ^0.8.0;

contract MyToken {
    string public name;
    string public symbol;
    uint256 public decimals;
    uint256 public totalSupply;


    event Transfer(address indexed from, address to, uint amount);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);

    mapping (address => uint) balances;
    mapping (address => mapping(address => uint)) allowed;


    constructor(string memory name_, string memory symbol_) {
        name = name_;
        symbol = symbol_;
        decimals = 18;
        totalSupply = 1000000000000000000;
    }

    function _name() public view returns (string memory) {
        return name;    // Returns the name of the token
    }

    function _symbol() public view returns(string memory) {
        return symbol;     // Returns the symbol of the token
    }

    function _decimals() public view returns(uint256) {
        return decimals;     // Returns the number of decimals the token uses - e.g. 8, means to divide the token amount by 100000000 to get its user representation
    }

    function _totalSupply() public view returns(uint256) {
        return totalSupply;     // Returns the total token supply
    }

    function balanceOf(address owner_) public view returns (uint256 balance) {
        return balances[owner_];  // Returns current token balance of an account
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return (a — b);
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256)   {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }


    function transfer(address payable reciever, uint256 value) public returns (bool) {
        require(value <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender].sub(value);
        balances[reciever] = balances[reciever].add(value);
        emit Transfer(msg.sender, reciever, value);
        return true;
    }

    function transferFrom(address payable owner, address payable buyer, uint256 value) public returns (bool) {
        require(value <= balances[owner], "Owner have not enough tokens");
        require(value <= allowed[owner][msg.sender], "Delegate has not permission to withdraw");
        balances[owner] = balances[owner].sub(value);
        allowed[owner][msg.sender] = allowed[owner][msg.sender].sub(value);
        balances[buyer] = balances[buyer].add(value);
        emit Transfer(owner, buyer, value); 
        return true;    
    }

    function approved(address delegate, uint value) public returns (bool) {
        allowed[msg.sender][delegate] = value;
        emit Approval(msg.sender, delegate, value);
        return true;
        // allow an owner (msg.sender) to approve a delegate account 
    }

}
