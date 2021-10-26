require_relative 'bank_operation'
require_relative 'bank_printer'

class BankAccount
  attr_reader :balance, :history

  def initialize
    @balance = 0
    @history = []
  end

  def deposit(amount)
    raise 'Please make sure to enter a positive number' unless valid_number?(amount)

    @history << BankOperation.new(Time.now, amount, '', @balance + amount)
    @balance += amount
  end

  def withdraw(amount)
    raise 'Please make sure to enter a positive number' unless valid_number?(amount)
    raise 'You cannot withdraw more than your current balance' unless insufficient_funds?(amount)

    @history << BankOperation.new(Time.now, '', amount, @balance - amount)
    @balance -= amount
  end

  private

  def insufficient_funds?(amount)
    @balance > amount
  end

  def valid_number?(amount)
    amount.is_a?(Numeric) && amount >= 0.01
  end
end