pragma solidity ^0.4.18;
import "browser/SafeMath.sol";
/**
 * @title Basic token
 * @dev Basic version of StandardToken, with no allowances.
 */
contract ERC20Token {
  using SafeMath for uint256;
  mapping(address => uint256) balances;
  mapping (address => mapping (address => uint256)) allowed;
  event Transfer(address _from, address _to, uint256 _amount);
  event Approval(address indexed owner, address indexed spender, uint256 value);
  /**
   * @dev Transfer tokens from one address to another
   * @param _from address The address which you want to send tokens from
   * @param _to address The address which you want to transfer to
   * @param _value uint256 the amount of tokens to be transferred
   */
  function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
    uint256 _allowance = allowed[_from][msg.sender];
    // Check is not needed because sub(_allowance, _value) will already throw if this condition is not met
    // require (_value <= _allowance);
    balances[_from] = balances[_from].sub(_value);
    balances[_to] = balances[_to].add(_value);
    allowed[_from][msg.sender] = _allowance.sub(_value);
    Transfer(_from, _to, _value);
    return true;
  }
  /**
   * @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
   *
   * Beware that changing an allowance with this method brings the risk that someone may use both the old
   * and the new allowance by unfortunate transaction ordering. One possible solution to mitigate this
   * race condition is to first reduce the spender's allowance to 0 and set the desired value afterwards:
   * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
   * @param _spender The address which will spend the funds.
   * @param _value The amount of tokens to be spent.
   */
  function approve(address _spender, uint256 _value) public returns (bool) {
    allowed[msg.sender][_spender] = _value;
    Approval(msg.sender, _spender, _value);
    return true;
  }
  /**
   * @dev Function to check the amount of tokens that an owner allowed to a spender.
   * @param _owner address The address which owns the funds.
   * @param _spender address The address which will spend the funds.
   * @return A uint256 specifying the amount of tokens still available for the spender.
   */
  function allowance(address _owner, address _spender) public constant returns (uint256 remaining) {
    return allowed[_owner][_spender];
  }
  /**
  * @dev transfer token for a specified address
  * @param _to The address to transfer to.
  * @param _value The amount to be transferred.
  */
  function transfer(address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
    // SafeMath.sub will throw if there is not enough balance.
    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    Transfer(msg.sender, _to, _value);
    return true;
  }
  /**
  * @dev Gets the balance of the specified address.
  * @param _owner The address to query the the balance of.
  * @return An uint256 representing the amount owned by the passed address.
  */
  function balanceOf(address _owner) public constant returns (uint256 balance) {
    return balances[_owner];
  }
}
contract EnergyToken is ERC20Token {
    using SafeMath for uint256;
    address owner; //= 0x14723a09acff6d2a60dcdf7aa4aff308fddc160c;
    uint256 totalSupply = 10000;
    uint256 tokensLeft = 10000;
    uint256 serviceFee = 0 ;
    
    function EnergyToken(uint256 initialBalance) public {
        balances[msg.sender] = initialBalance;
        tokensLeft -= initialBalance;
        owner = msg.sender;
    }
    
    //function depositEnergy(uint256 surplusEner)
    
    function depositEnergy(uint256 surplusEnergy) public {
        balances[msg.sender] += surplusEnergy;
        tokensLeft -= surplusEnergy;
    }
    
    function showServiceFee() public view returns (uint256){
        return serviceFee;
    }
    
    function withdrawEnergy(uint256 amountEnergy) public payable {
        //fee - taken out because causes transaction to fail when implementing the javascript communication
        serviceFee = amountEnergy*1 ether;
        require(msg.value >= serviceFee);
        owner.transfer(serviceFee);
        
        //token
        require(balances[msg.sender]>amountEnergy);
        balances[msg.sender] -= amountEnergy;
        tokensLeft += amountEnergy;
        
    }
    
    /*
    function getServiceFee() public {
        //transfer from contract to owner of contract
        //require(msg.sender == owner);
        //msg.sender.transfer(this.balance);
        owner.transfer(this.balance)
    }*/
    
    function getContractBalanceETH() public view returns (uint256) {
        return this.balance;
    }
    
    function getBalance() public view returns (uint256)  {
        return balances[msg.sender];
    }
    
    event Mint(address indexed to, uint256 amount);
    /**
    * @dev Function to mint tokens
    * @param _to The address that will receive the minted tokens.
    * @param _amount The amount of tokens to mint.
    * @return A boolean that indicates if the operation was successful.
    */
    function mint(address _to, uint256 _amount) public returns (bool) {
        totalSupply = totalSupply.add(_amount);
        balances[_to] = balances[_to].add(_amount);
        Mint(_to, _amount);
        Transfer(0x0, _to, _amount);
        return true;
    }
}
