class BankAccount

  attr_reader :balance, :transactions, :current_transaction, :time

  TIME = Time.now.strftime("%d/%m/%y %H:%M")
  DEFAULT_BALANCE = 0

  def initialize
    @balance = DEFAULT_BALANCE
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    confirm_transaction(amount)
  end

  def withdraw(amount)
    fail "Insufficient funds" if @balance < amount
    @balance -= amount
    confirm_transaction(amount)
  end

  def confirm_transaction(amount)
    @transactions.push("#{amount}, #{TIME}, #{@balance}")
  end

end
