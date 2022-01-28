pragma solidity 0.8.4;

interface cETH {
    function mint() external payable;
    function reedeem(uint reedemTokens) external returns (uint);
    
    function exchangeRateStored() external view returns (uint);
    function balanceOf(address owner) external view returns (uint256 balance);

}

contract bankAccount {
    uint totalContractBalance = 0;
    address COMPOUND_CETH_ADDRESS = 0x859e9d8a4edadfEDb5A2fF311243af80F85A91b8;
    cETH ceth = cETH(COMPOUND_CETH_ADDRESS);
    
    function getContractBalance() public view returns(uint) {
        return totalContractBalance;
    }

    mapping(address => uint ) balances;
    mapping(address => uint ) depositTimestamps;

    function addBalance() public payable {
        balances[msg.sender] = msg.value;
        totalContractBalance = totalContractBalance + msg.value;
        depositTimestamps[msg.sender] = block.timestamp;
    }

    function getContractBalance(address userAddress) public view returns(uint256) {
        return ceth.balanceOf(userAddress);
    }

    function withdraw() public payable {
        address payable withdrawTo = payable(msg.sender);
        uint amountToTransfer = getBalance(msg.sender);
        withrawTo.transfer(amountToTransfer);
        totalContractBalance = totalContractBalance - amountToTransfer;
        balances[msg.sender] = 0;
    }
    function addMoneyToContract() public payable {
        totalContractBalance += msg.value;
    }
}