// SPDX-License-Identifier: MIT
// pragma solidity ^0.5.0;
pragma solidity >=0.4.00 <0.9.0;

// TestRPC HD wallet

contract FruitOfLove {

  address public owner; //

  struct Payee {  // 수취인
    bool status;  // 상태
    int8 balance; // 잔여량
    int8 weight;  // 기부량
  }

  //mapping (address => Payee) public payees;
  //mapping (int8 => address) public payeesIndex;
  mapping (int8 => Payee) public payees;
  int8 public payeesIndexSize;

  // 이벤트 선언
  event NewDonation(address indexed donator, uint amt);
  event Transfer(address indexed from, address indexed to, uint amt);
  event PayeeAction(address indexed payee, bytes32 action);
  event Withdrawal(address indexed payee, uint amt);
  event OwnerChanged(address indexed owner, address indexed newOwner);
  event ContractDestroyed(address indexed contractAddress);

  // Constructor
  constructor() public {
    payees[0].status = true;
    payeesIndexSize = 1; // // 관리자
  }

  function addPayee(int8 _payee) public returns (int8) {
    payees[_payee].status = true;
    payees[_payee].balance = 0;
    payees[_payee].weight = 0;
    payeesIndexSize++;
    return payeesIndexSize - 1;
  }

  function getBalance(int8 wallet_id) public returns (int8) {
    return payees[wallet_id].balance;
  }

  function donate(int8 from, int8 to, int8 amount) public {
    payees[to].balance += (amount * 95 / 100);
    payees[from].weight += amount;
    payees[0].balance += (amount * 5 / 100);
  }
  
  function hihi(int8 from, int8 to, int8 amount) public {
    payees[0].balance = amount;
  }

}
