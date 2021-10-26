require_relative 'bank_account'
require_relative 'bank_operation'

class BankPrinter

  def self.print_statement(history)
    puts 'date || credit || debit || balance'
    history.each do |log|
      puts "#{formatted_time(log.date)} || #{formatted_number(log.credit)} || " + 
      "#{formatted_number(log.debit)} || #{formatted_number(log.new_balance)}"
    end
  end

  class << self
    private

    def formatted_number(number)
      '%.2f' % number if number.is_a?(Numeric)
    end

    def formatted_time(time)
      time.strftime('%d/%m/%Y')
    end
  end
end