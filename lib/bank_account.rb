require 'pry'
require_relative './transfer'

class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  @@all = []

  ############ CLASS METHODS ############
  def self.all
    @@all
  end

  ############ INSTANCE METHODS ############
  def initialize(name)
    @name = name

    @balance = 1000
    @status = "open"

    @@all << self
  end

  def deposit(amount)
    self.balance += amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    self.status == "open" && self.balance > 0
  end

  def close_account
    self.status = "closed"
  end

end #end of BankAccount class
