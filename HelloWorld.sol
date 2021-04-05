pragma solidity ^0.5.0;

contract HelloWorld{
    
    string public data;
    
    
    function hello()  pure public returns(string memory){
        return "Hello World";
    }
    
    function set(string memory input) public 
    {
        data=input;
    }
    
    function get()  public view returns(string memory){
        return data;
    }
}