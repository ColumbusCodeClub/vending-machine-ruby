class VendingMachine
  VALUES = {:nickel => 0.05, :dime => 0.10 , :quarter => 0.25}

  def initialize
    @sum = 0
    @displayText = 'INSERT COIN'
  end

  def display
    @displayText
  end

  def insertCoin(coin)
    @sum += VALUES[coin]
    @displayText = "%0.2f" % @sum
  end

end
