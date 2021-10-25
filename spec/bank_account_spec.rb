require 'bank_account'

describe BankAccount do
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