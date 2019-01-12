require_relative "./lib/transfer"
require_relative "./lib/bank_account"

b1 = BankAccount.new("joe")
b2 = BankAccount.new("betty")

b1.balance = 1

puts b1.valid?

t1 = Transfer.new(b1, b2, 30)

puts t1.valid?

t1.execute_transaction
