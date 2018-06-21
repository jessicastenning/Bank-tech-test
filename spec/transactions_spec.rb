require 'transactions'

describe Transactions do
  subject(:transaction) { Transactions.new }
  let(:transaction1) do
    { date: DATE, credit: '10.00', debit: '------', balance: '10.00' }
  end
  let(:transaction2) do
    { date: DATE, credit: '------', debit: '8.00', balance: '2.00' }
  end
  DATE = Time.now.strftime('%d/%m/%y')

  describe '#initialize' do
    it 'should have a default balance of zero' do
      expect(transaction.balance).to eq 0
    end
    it 'should have a transaction history equal to an empty array ' do
      expect(transaction.transaction_history).to eq []
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
    it 'should record the details of a transaction' do
      transaction.deposit(10)
      expect(transaction.transaction_history).to include(transaction1)
    end
    it 'should record details of multiple transactions' do
      transaction.deposit(10)
      transaction.withdraw(8)
      expect(transaction.transaction_history).to include(transaction1, transaction2)
    end
  end
end
