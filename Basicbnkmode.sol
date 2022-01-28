pragma solidity 0.8.4;

contract bankAccount {
    uint totalContractBalance = 0;
    
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

    function getContractBalance(address userAddress) public view returns(uint) {
        uint principal = balances[userAddress];
        uint timeElapsed = block.timestamp - depositedTimestamps[userAdress];// in seconds
        return principal + uint((principal * 7 * timeElapsed) / (100 * 365 * 24 * 60 * 60)) + 1;
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