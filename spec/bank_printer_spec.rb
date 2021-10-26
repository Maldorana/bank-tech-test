require 'bank_printer'
require 'bank_operation'

  describe 'the bank statement can be printed' do
    let(:statement) { [
      BankOperation.new(Time.now, 100, '', 100),
      BankOperation.new(Time.now, '', 50, 50)
    ] }

    it 'prints the statement with all the banking operations' do
      allow(Time).to receive(:now).and_return Time.parse('2021-10-26')

      expect { BankPrinter.print_statement(statement) }.to output("date || credit || debit || balance\n" +
      "#{Time.now.strftime('%d/%m/%Y')} || 100.00 ||  || 100.00\n" + 
      "#{Time.now.strftime('%d/%m/%Y')} ||  || 50.00 || 50.00\n").to_stdout
    end
  end