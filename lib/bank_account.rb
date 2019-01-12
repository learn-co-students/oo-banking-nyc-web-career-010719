require 'pry'

class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  @@all = []

  def initialize(name, balance = 1000, status = "open")
    @name = name
    @balance = balance
    @status = status
  end

  def self.all
    @@all
  end

  def deposit(balance)
    @balance += balance
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    if status == "open" && balance > 0
      return true
    end
    false
  end

  def close_account
    self.status = "closed"
  end

end
