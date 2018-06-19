class BankAccount

  attr_reader :balance, :transactions, :current_transaction, :time

  TIME = Time.now.strftime("%d/%m/%y %H:%M")

  def initialize
    @balance = 0
    @transactions = []
    @current_transaction = []
  end

  def deposit(amount)
    @balance += amount
    @current_transaction.push("#{amount}, #{TIME}, #{@balance}")
  end

  def withdraw(amount)
    fail "Insufficient funds" if @balance < amount
    @balance -= amount
  end

end
