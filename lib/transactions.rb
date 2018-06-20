class Transactions
  attr_reader :transaction_history, :balance

  DEFAULT_BALANCE = 0

  def initialize
    @balance = DEFAULT_BALANCE
    @transaction_history = []
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
    transaction = Time.now.strftime('%d/%m/%y'), amount, type, @balance
    @transaction_history.push(transaction)
  end

  def balance_increase(amount)
    @balance += amount
  end

  def balance_decrease(amount)
    @balance -= amount
  end
end
