pragma solidity >=0.5.0 <0.7.0;


contract Will{
    
    address owner;
    uint amount;
    bool deceased;
    
    constructor () public payable{
        owner=msg.sender;
        amount=msg.value;
        deceased=false;
    }
    
    modifier onlyowner() {
        require(owner==msg.sender);
        _;
    }
    
    modifier isdeceased(){
        require(deceased==true);
        _;
    }
    
    address payable[] familywallet;
    mapping(address => uint) inheritance;
    
    function setInheritance (address payable wallet,uint inAmount) public onlyowner{
        familywallet.push(wallet);
        inheritance[wallet]=inAmount;
    }
    
    function hasdeceased() public onlyowner{
        deceased=true;
        payout();
    }
    
    function payout() private isdeceased{
        
        for(uint i=0;i<familywallet.length;i++)
         {  familywallet[i].transfer(inheritance[familywallet[i]]);
         }
         
    }
    
}


