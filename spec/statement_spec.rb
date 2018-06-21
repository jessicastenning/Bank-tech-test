require 'statement'

describe Statement do
  subject(:statement) { Statement.new }

  let(:transaction_history) do
    [{ date: '20/06/18', credit: 100, debit: '---', balance: 100 },
     { date: '21/06/18', credit: '---', debit: 100, balance: 0 }]
  end

  describe '#pretty_print' do
    let(:pretty_print) do
      " Date     || Credit || Debit || Balance\n" \
      " 21/06/18 || ---    || 100   || 0\n" \
      " 20/06/18 || 100    || ---   || 100\n"
    end
    it 'should print the transaction_history' do
      expect { statement.pretty_print(transaction_history) }.to output(pretty_print).to_stdout
    end
  end
end
