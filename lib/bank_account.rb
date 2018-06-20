require_relative './transactions'
require_relative './statement'

class BankAccount
  attr_reader :transactions, :statement

  def initialize(transactions, statement)
    @transactions = transactions
    @statement = statement
  end

  def deposit(amount)
    transactions.deposit(amount)
  end

  def withdraw(amount)
    transactions.withdraw(amount)
  end

  def print_statement
    statement.pretty_print(transactions.transaction_history)
  end
end
