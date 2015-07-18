class VendingMachine

  attr_reader :coin_return, :item_bin

  VALUES = {
    :nickel => 5,
    :dime => 10,
    :quarter => 25
  }

  ITEMS = {
      :chips => 0.75
  }

  def initialize
    @sum = 0
    @coin_return = []
    @coins = []
    @item_bin = []
  end

  def display
    @sum == 0 ? 'INSERT COIN' : "%0.2f" % (@sum / 100.0)
  end

  def insertCoin(coin)
    if VALUES.has_key?(coin)
      @sum += VALUES[coin]
      @coins << coin
    else
      @coin_return << coin
    end
  end

  def return_coins
    @coin_return = @coins
    zero_out_money
  end

  def press_chips
    if display.to_f >= ITEMS[:chips]
      @item_bin << :chips
      zero_out_money
    end
  end

  def zero_out_money
    @sum = 0
    @coins = []
  end

end
