require 'pry'
require_relative './transfer'
require_relative './bank_account'


b1 = BankAccount.new("avi")
b2 = BankAccount.new("bri")

t1 = Transfer.new(b1, b2, 50)

b3 = BankAccount.new("cat")
b4 = BankAccount.new("dev")

b3.status = "closed"

t2 = Transfer.new(b3, b4, 100)


binding.pry
puts "the end"
