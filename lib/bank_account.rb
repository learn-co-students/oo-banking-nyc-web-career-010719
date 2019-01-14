class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"

    @@all << self
  end

    def deposit(amnt)
      @balance += amnt
    end

    def display_balance
      "Your balance is $#{@balance}."
    end

    def valid?
      @balance > 0 && @status == "open"
    end

    def close_account
      @status = "closed"
    end






end #end of Bank Account class
