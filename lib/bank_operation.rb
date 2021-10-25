class BankOperation
  attr_reader :date, :credit, :debit, :new_balance

  def initialize(date, credit, debit, new_balance)
    @date = date
    @credit = credit
    @debit = debit
    @new_balance = new_balance
  end
end