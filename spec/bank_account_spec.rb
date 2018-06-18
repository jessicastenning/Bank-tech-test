require 'bank_account'

describe Bank_account do

  describe '#balance' do
    it 'should have a default balance of zero' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#deposit' do
    it 'should allow the user to deposit funds' do
      subject.deposit(10)
      expect(subject.balance).to eq 10
    end
  end

  describe '#withdraw' do
    it 'should allow users to withdraw funds' do
      subject.deposit(15)
      subject.withdraw(10)
      expect(subject.balance).to eq 5
    end
  end 

end
