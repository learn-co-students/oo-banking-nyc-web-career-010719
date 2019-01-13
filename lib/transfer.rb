require 'pry'
require_relative './bank_account'

class Transfer
  attr_reader :sender, :receiver #sender and receiver are instances of BankAccount class
  attr_accessor :status, :amount

  @@all = []

  ############ CLASS METHODS ############
  def self.all
    @@all
  end

  ############ INSTANCE METHODS ############
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount

    @status = "pending"

    @@all << self
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.status == "pending" && self.sender.balance > self.amount
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
    # binding.pry
  end

end #end of Transfer class
