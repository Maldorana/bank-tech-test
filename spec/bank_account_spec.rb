require 'bank_account'

describe BankAccount do
  it 'has an initial balance of 0' do
    expect(subject.balance).to eq(0)
  end
end