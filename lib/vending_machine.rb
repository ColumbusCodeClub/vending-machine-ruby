class VendingMachine

  attr_reader :coin_return

  VALUES = {
    :nickel => 5,
    :dime => 10,
    :quarter => 25
  }

  def initialize
    @sum = 0
    @coin_return = []
  end

  def display
    @sum == 0 ? 'INSERT COIN' : "%0.2f" % (@sum / 100.0)
  end

  def insertCoin(coin)
    if VALUES.has_key?(coin)
      @sum += VALUES[coin]
    else
      @coin_return << coin
    end
  end
end
