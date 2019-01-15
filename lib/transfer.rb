require 'pry'
require_relative './bank_account'


class Transfer


  attr_accessor :transfer, :status, :amount, :sender, :receiver

  def initialize(transfer, status, amount = 50)
    @transfer = transfer
    @status = "pending"
    @amount = amount
    @sender = transfer
    @receiver = status
    # binding.pry

  end

  def valid?
    if @sender.valid? && @receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    # binding.pry

    if valid? && @status == "pending"
      if sender.balance > amount
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    else
       @status = "rejected"

    "Transaction rejected. Please check your account balance."
    end
  end
# @status = "complete"
  end

  def reverse_transfer

   if @status == "complete"
     sender.balance += @amount
     receiver.balance -= @amount
     @status ="reversed"
        # receiver.balance -= amount
        # sender.balance += amount

    end
  end









end # end of Transfer class
