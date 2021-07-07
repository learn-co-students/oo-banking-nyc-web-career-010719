require 'pry'
require_relative '../lib/transfer'

class BankAccount
  attr_accessor :balance, :status
  attr_reader :name, :sender, :receiver

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(deposit)
    self.balance += deposit
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    if @status == "open" && @balance > 0
      true
    else
      false
    end
  end

  def close_account
    self.status= "closed"
  end

end #end of class

b1 = BankAccount.new("chris")
b2 = BankAccount.new("jon")
# binding.pry
