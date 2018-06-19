require 'transactions'

describe Transactions do
  subject(:transaction) { Transactions.new }

  describe '#balance' do
    it 'should have a default balance of zero' do
      expect(transaction.balance).to eq 0
    end
  end

  describe '#withdraw' do
    it 'should allow users to withdraw funds' do
      transaction.deposit(15)
      transaction.withdraw(10)
      expect(transaction.balance).to eq 5
    end
    it 'should raise an error if withdrawal amount is greater than balance' do
      expect { transaction.withdraw(10) }.to raise_error 'Insufficient funds'
    end
  end

  describe '#deposit' do
    it 'should allow the user to deposit funds' do
      transaction.deposit(10)
      expect(transaction.balance).to eq 10
    end
  end

  describe '#transactions' do
    it 'should record details of a deposit transaction' do
      transaction.deposit(10)
      expect(transaction.transactions).to include("10, #{Transactions::TIME}, 10")
    end
    it 'should record details of a withdrawal transaction' do
      transaction.deposit(10)
      transaction.withdraw(8)
      expect(transaction.transactions).to include("8, #{Transactions::TIME}, 2")
    end
  end
end
