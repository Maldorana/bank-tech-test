require 'bank_account'

describe BankAccount do
  describe 'basic banking functions' do
    it 'has an initial balance of 0' do
      expect(subject.balance).to eq(0)
    end

    it 'can deposit to the balance' do
      subject.deposit(100)
      expect(subject.balance).to eq(100)
    end

    it 'can withdraw from the balance' do
      subject.deposit(100)
      expect(subject.balance).to eq(100)
      subject.withdraw(50)
      expect(subject.balance).to eq(50)
    end
  end

  describe 'banking operations are saved in a log for each account' do
    it 'has an initial history which is empty' do
      expect(subject.history).to eq([])
    end

    it 'increases the amount of items stored in the log for each banking operations' do
      subject.deposit(100)
      subject.deposit(200)
      subject.withdraw(50)
      expect(subject.history.length).to eq(3)
    end

    it 'saves all the data for the deposit operation into the log' do
      subject.deposit(100)
      expect(subject.history[0].date).to eq(Time.now.strftime("%d/%m/%Y"))
      expect(subject.history[0].credit).to eq(100)
      expect(subject.history[0].debit).to eq('')
      expect(subject.history[0].new_balance).to eq(100)
    end

    it 'saves all the data for the withdrawal operation into the log' do
      subject.deposit(100)
      subject.withdraw(25)
      expect(subject.history[1].date).to eq(Time.now.strftime("%d/%m/%Y"))
      expect(subject.history[1].credit).to eq('')
      expect(subject.history[1].debit).to eq(25)
      expect(subject.history[1].new_balance).to eq(75)
    end
  end

  describe 'the log can be consulted' do
    it 'prints the header of the statement' do
      subject.deposit(100)
      expect { subject.statement }.to output("date || credit || debit || balance\n25/10/2021 || 100.00 ||  || 100.00\n").to_stdout
    end
  end

  describe 'exceptions and errors' do
    it 'raises an error if withdrawal amount is higher than balance' do
      expect { subject.withdraw(1) }.to raise_error('You cannot withdraw more than your current balance')
    end

    it 'raises an error if deposit amount given isnt a positive number' do
      expect { subject.deposit(-1) }.to raise_error('Please make sure to enter a positive number')
      expect { subject.deposit([1, 3]) }.to raise_error('Please make sure to enter a positive number')
      expect { subject.deposit("Hello") }.to raise_error('Please make sure to enter a positive number')
    end

    it 'raises an error if withdrawal amount given isnt a positive number' do
      subject.deposit(100)
      expect { subject.withdraw(-1) }.to raise_error('Please make sure to enter a positive number')
      expect { subject.withdraw([1, 3]) }.to raise_error('Please make sure to enter a positive number')
      expect { subject.withdraw("Hello") }.to raise_error('Please make sure to enter a positive number')
    end
  end
end
