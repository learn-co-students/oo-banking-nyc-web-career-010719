class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, balance = 1000, status = "open")
    @name = name
    @balance = balance
    @status = status

    @@all << self
  end

  #BankAccount #deposit can deposit money into its account
  def deposit(money)
    self.balance += money
  end

  #BankAccount #display_balance can display its balance
  def display_balance
    "Your balance is $#{balance}."
  end

  #BankAccount #valid? is valid with an open status and a balance greater than 0
  def valid?
    self.status == "open" && self.balance > 0 ? true : false
  end

  #BankAccount can close its account
  def close_account
    self.status = "closed"
  end
end #end of my BankAccount class
