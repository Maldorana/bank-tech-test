require 'bank_operation'

class BankAccount
  attr_reader :balance, :history

  def initialize
    @balance = 0.00
    @history = []
  end

  def deposit(amount)
    raise 'Please make sure to enter a positive number' unless valid_number?(amount)

    @balance += amount
    @history << BankOperation.new(formatted_time(Time.now), amount, '', @balance)
  end

  def withdraw(amount)
    raise 'Please make sure to enter a positive number' unless valid_number?(amount)
    raise 'You cannot withdraw more than your current balance' unless insufficient_funds?(amount)

    @balance -= amount
    @history << BankOperation.new(formatted_time(Time.now), '', amount, @balance)
  end

  private

  def formatted_time(time)
    time.strftime("%d/%m/%Y")
  end

  def insufficient_funds?(amount)
    @balance > amount
  end

  def valid_number?(amount)
    amount.is_a?(Numeric) && amount >= 0.01
  end
end