pragma solidity >=0.4.22 <0.7.0;

contract CellPhone {
    
    uint256 monthlyCost;
    
    constructor (uint256 cost) public {
        monthlyCost=cost;
        
    }
    
    function currentCost() public view returns(uint256){
        return monthlyCost;
    }
    //function makePaymnet() payable public{}
    function withdrawBalance() public{
        msg.sender.transfer(address(this).balance);
    }
    
    function isBalanceCurrent(uint256 months) public view returns (bool){
        return monthlyCost*months>= address(this).balance;
    }
}