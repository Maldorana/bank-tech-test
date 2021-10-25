class BankAccount
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    raise 'You cannot withdraw more than your current balance' if @balance < amount
    
    @balance -= amount
  end
end