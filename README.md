# Bank Tech Test
A practice test delivered at Makers Academy, focused on the production of best practice code, obeying the principles of OO Design and TDD.

### Requirements:
Build a command line app that operates like a bank account - a user should be able to make deposits and withdrawals
and request an account statement detailing the date, amount, and balance of all transactions.

[Click here](https://github.com/makersacademy/course/blob/master/individual_challenges/bank_tech_test.md) to read the full brief.

##  Installation

From the command line, clone this repository to your machine
```
git clone git@github.com:jessicastenning/bank-tech-test.git
```
once cloned, install the associated ruby gems
```
bundle install
```
## Approach

To better understand the requirements of the brief, I broke down the requested features into User Stories.

## User Stories
```
As a user,
So that I can save my money,
I'd like to be able to deposit funds in my bank account.

As a user,
So that I can access my savings,
I'd like to be able to withdraw funds from my bank account.

As a user,
So that I can review the timing of my transactions,
I'd like to be able to view the date each transaction was made.

As a user,
So that I can check what savings I have available,
I'd like to be able to view my balance.

As a user,
So that I can stay on top of my finances,
I'd like to be able to view my bank statement.
```
I adopted the Domain Model to separate the above features into Objects and messages to give me my initial
structure - 3 distinct classes with associated methods - BankAccount, Transactions, and Statement.

TDD principles were followed from the outset using the Red, Green Refactor approach.

## Running the program in IRB
```
# Load the file
require './lib/bank_account.rb'

# Create a new bank account, and perform some transactions
new_account = BankAccount.new(Transactions.new, Statement.new)
new_account.deposit(200)
new_account.withdraw(100)
new_account.deposit(250)

# Review your bank statement
new_account.print_statement

# =>
 Date     || Credit  || Debit    || Balance
 21/06/18 || 250.00  || ------   || 350
 21/06/18 || ------- || 100.00   || 100
 21/06/18 || 200.00  || ------   || 200
```

## Testing and Code quality
All tests were written using Rspec, with 100.00% test coverage as documented by Simplecov.  

Run the tests
```
rspec
```
Rubocop was used to maintain Ruby code quality.
