class Statement

  def pretty_print(transaction_history)
    header
    transaction_history.reverse_each do |transaction|
      print " #{transaction[:date]} ||",
            " #{transaction[:credit]}    ||",
            " #{transaction[:debit]}   ||",
            " #{transaction[:balance]}\n"
    end
  end

  def header
    puts ' Date     || Credit || Debit || Balance'
  end
end
