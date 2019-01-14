class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  #Transfer #valid? can check that both accounts are valid AND calls on the sender and recievers #valid? methods
  def valid?
    sender.valid? && receiver.valid?
  end

  #Transfer #execute_transaction can execute a successful transaction between two accounts AND each transfer can only happen once AND rejects a transfer if the sender doesn't have a valid account
  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject_transfer
    end
  end

  #Transfer #reverse_transfercan reverse a transfer between two accounts AND it can only reverse executed transfers
  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"  
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end #end of my Transfer class
