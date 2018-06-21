class Transactions
  attr_reader :transaction_history, :balance

  DEFAULT_BALANCE = 0

  def initialize
    @balance = DEFAULT_BALANCE
    @transaction_history = []
  end

  def deposit(amount)
    balance_increase(amount)
    confirm_deposit(amount)
  end

  def withdraw(amount)
    raise 'Insufficient funds' if @balance < amount
    balance_decrease(amount)
    confirm_withdraw(amount)
  end

  private

  def confirm_deposit(amount)
    transaction = {
      date: Time.now.strftime('%d/%m/%y'),
      credit: '%.2f' % amount,
      debit: '------',
      balance: '%.2f' % @balance
    }
    @transaction_history.push(transaction)
  end

  def confirm_withdraw(amount)
    transaction = {
      date: Time.now.strftime('%d/%m/%y'),
      credit: '------',
      debit: '%.2f' % amount,
      balance: '%.2f' % @balance
    }
    @transaction_history.push(transaction)
  end

  def balance_increase(amount)
    @balance += amount
  end

  def balance_decrease(amount)
    @balance -= amount
  end
end
