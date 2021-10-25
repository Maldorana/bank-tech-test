require 'bank_account'

describe BankAccount do
  describe 'basic banking functions' do
    it 'has an initial balance of 0' do
      expect(subject.balance).to eq(0.00)
    end

    it 'can deposit to the balance' do
      subject.deposit(100)
      expect(subject.balance).to eq(100.00)
    end

    it 'can withdraw from the balance' do
      subject.deposit(100)
      expect(subject.balance).to eq(100.00)
      subject.withdraw(50)
      expect(subject.balance).to eq(50.00)
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