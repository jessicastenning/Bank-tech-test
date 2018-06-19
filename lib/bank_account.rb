require_relative './transactions'

class BankAccount
  attr_reader :transactions

  def initialize(transactions)
    @transactions = transactions
  end

  def deposit(amount)
    transactions.deposit(amount)
  end

  def withdraw(amount)
    transactions.withdraw(amount)
  end
end
