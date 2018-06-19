require 'bank_account'

describe BankAccount do
  subject(:bank_account) { BankAccount.new(transactions) }
  let(:transactions) { double("transactions") }

  describe '#initialize' do
    it 'should create an instance of transactions' do
      expect(bank_account.transactions).to eq(transactions)
    end
  end

  describe '#deposit' do
    it 'should call the deposit method on transactions' do
      allow(transactions).to receive(:deposit)
      bank_account.deposit(10)
      expect(transactions).to have_received(:deposit)
    end
  end

  describe '#withdraw' do
    it 'should call the withdraw method on transactions' do
      allow(transactions).to receive(:withdraw)
      bank_account.withdraw(5)
      expect(transactions).to have_received(:withdraw)
    end
  end
end
