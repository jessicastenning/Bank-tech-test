class BankAccount

  attr_reader :balance, :transactions, :time

  TIME = Time.now.strftime("%d/%m/%y %H:%M")
  DEFAULT_BALANCE = 0

  def initialize
    @balance = DEFAULT_BALANCE
    @transactions = []
  end

  def deposit(amount)
    balance_increase(amount)
    confirm_transaction(amount)
  end

  def withdraw(amount)
    fail "Insufficient funds" if @balance < amount
    balance_decrease(amount)
    confirm_transaction(amount)
  end

  private

  def confirm_transaction(amount)
    @transactions.push("#{amount}, #{TIME}, #{@balance}")
  end

  def balance_increase(amount)
    @balance += amount
  end

  def balance_decrease(amount)
    @balance -= amount
  end

end
