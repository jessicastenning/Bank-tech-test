require 'bank_account'

describe BankAccount do
  subject(:bank_account) { BankAccount.new(Transactions.new) }
end
