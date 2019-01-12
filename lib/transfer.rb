require 'pry'
require_relative '../lib/bank_account'

class Transfer
  # your code here
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.valid? && sender.balance > @amount && self.status == "pending"
      sender.balance -= @amount
      receiver.balance += @amount
      self.status= "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.valid? && receiver.balance > @amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    end
  end

end #end of class

# t1 = Transfer.new(b1, b2, 100)
# binding.pry
