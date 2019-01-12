class Transfer
  # your code here
  attr_accessor :status
  attr_reader :amount, :receiver, :sender

  def initialize(sender,receiver,amount)
    @status = 'pending'
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    receiver.valid? && sender.valid?
  end

  def execute_transaction
    if self.status == 'pending' && self.valid? && sender.balance > amount
      sender.balance -= amount
      receiver.balance += amount
      self.status = 'complete'
    else
      reject_transaction
    end
  end

  def reject_transaction
    self.status = 'rejected'
    return "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if self.status == 'complete'
      sender.balance += amount
      receiver.balance -= amount
      self.status = 'reversed'
    end
  end
end
