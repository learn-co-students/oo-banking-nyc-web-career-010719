class Transfer

  attr_accessor
  attr_reader

  @@all = []

  def self.all
    @@all
  end

  def initialize(argument)
    @argument = argument
  end
end

# We're going to build a BankAccount class where one instance of the class
# can transfer money to another instance through a Transfer class.
#
# The Transfer class acts as a space for a transaction between two instances
# of the bank account class. Think of it this way: you can't just transfer
# money to another account without the bank running checks first. Transfer
# instances will do all of this, as well as check the validity of the accounts
# before the transaction occurs. Transfer instances should be able to reject
# a transfer if the accounts aren't valid or if the sender doesn't have the
# money.
#
# Transfers start out in a "pending" status. They can be executed and go to a
# "complete" state. They can also go to a "rejected" status. A completed
# transfer can also be reversed and go into a "reversed" status.
