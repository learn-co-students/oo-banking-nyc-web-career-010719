require 'pry'
require_relative '../lib/bank_account'
require_relative '../lib/transfer'



b1 = BankAccount.new("chris")
b2 = BankAccount.new("jon")

t1 = Transfer.new(b1, b2, 100)

b1.balance

# binding.pry
