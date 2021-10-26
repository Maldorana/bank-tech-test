# Bank tech test

## Specification

Bank Tech Test is a program that allows the user to deposit and withdraw cash from a digital account. So that a user can keep track of their finances, the user's balance and banking operation are stored and can be viewed within the application.

### How it works
- Interactions via IRB
- Data kept in memory (no database)

### Requirements
- User can see their balance
- User can make deposits
- User can make withdrawals
- Save and print a history of the banking operations (date, amount, new balance)

### Acceptance criteria

- **Given** a client makes a deposit of 1000 on 10-01-2023
- **And** a deposit of 2000 on 13-01-2023
- **And** a withdrawal of 500 on 14-01-2023
- **When** she prints her bank statement
- **Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

# Set up

### Technologies

- Ruby 3.0.1
- RSpec for testing
- Rubocop for formatting
- SimpleCov for test coverage

## Installation and Bank Tech Test launching steps 

1. Clone this repo with `git clone https://github.com/Maldorana/bank-tech-test.git`
1. Change directory into your local clone with `cd bank-tech-test`
1. In your terminal, run `irb -r './lib/bank_account.rb'`
1. In IRB, type `account = Account.new` to create a new Bank account object named account.

## How to use Bank Tech Test

Listed below are some methods you can call in this application.

### Making a cash deposit
`account.deposit(amount)`

Examples:

`account.deposit(50)` - deposits £50 into the account

`account.deposit(99.99)` - deposits £99.99 into the account

### Making a cash withdrawal
`account.withdraw(amount)`

Examples:

`account.withdraw(10)` - withdraws £10 from the account

`account.withdraw(50)` - withdraws £50 from the account 

*__*You cannot withdraw more than the amount of your current balance.*__*

### Viewing your account balance
`account.balance`

This feature will print the account's current balance.

### Viewing your account statement
`BankPrinter.print_statement(account.history)`

This feature will print the account's bank statement.

## For Developers to install

1. Clone this repo with `git clone https://github.com/Maldorana/bank-tech-test.git`
1. Change directory into your local clone with `cd bank-tech-test`
1. run `bundle install`
1. All tests can be run by typing `rspec` in the terminal

### Notes on development
- I wrote this program in Ruby and used a TDD development process to implement its features, achieving 100% test coverage in the end.

![Tests and coverage](/img/tests.png)

- To keep things simple yet organised, I created my program using 3 classes: `BankAccount`, `BankOperation` and `BankPrinter`.

| Class name  | Description | Attributes | Methods
| ----------- | ----------------- | ---------- | ------- 
| `BankAccount`  | The user interface of the account  | `balance`, `history` | `deposit(amount)`, `withdraw(amount)` - allows the user to deposit/withdraw money respectively
| `BankOperation` | Stores data of a single transaction | `date`, `credit`, `debit`, `new_balance` | |
| `BankPrinter` | Prints the bank statement | | `self.print_statement(history)` |

# Demo

![Tests and coverage](/img/bank-demo2.gif)

