require 'bank_account'

describe BankAccount do
  subject(:bank_account) { BankAccount.new }

  describe '#balance' do
    it 'should have a default balance of zero' do
      expect(bank_account.balance).to eq 0
    end
  end

  describe '#deposit' do
    it 'should allow the user to deposit funds' do
      bank_account.deposit(10)
      expect(bank_account.balance).to eq 10
    end
  end

  describe '#withdraw' do
    it 'should allow users to withdraw funds' do
      bank_account.deposit(15)
      bank_account.withdraw(10)
      expect(bank_account.balance).to eq 5
    end
    it 'should raise an error if withdrawal amount is greater than balance' do
      expect { bank_account.withdraw(10) }.to raise_error 'Insufficient funds'
    end
  end

  describe '#current_transaction' do
    it 'should record details of a deposit transaction' do
      bank_account.deposit(10)
      expect(bank_account.transactions).to include("10, #{BankAccount::TIME}, 10")
    end
    it 'should record details of a withdrawal transaction' do
      bank_account.deposit(10)
      bank_account.withdraw(8)
      expect(bank_account.transactions).to include("8, #{BankAccount::TIME}, 2")
    end
  end
end
