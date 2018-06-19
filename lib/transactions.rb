class Transactions
  attr_reader :transactions, :balance

  DEFAULT_BALANCE = 0

  def initialize
    @balance = DEFAULT_BALANCE
    @transactions = []
  end

  def deposit(amount)
    balance_increase(amount)
    confirm_transaction("credit", amount)
  end

  def withdraw(amount)
    raise 'Insufficient funds' if @balance < amount
    balance_decrease(amount)
    confirm_transaction("debit", amount)
  end

  private

  def confirm_transaction(type, amount)
    @transactions.push("#{type}, #{amount}, #{Time.now.strftime('%d/%m/%y')}, #{@balance}")
  end

  def balance_increase(amount)
    @balance += amount
  end

  def balance_decrease(amount)
    @balance -= amount
  end
end
