describe VendingMachine do

  it 'displays INSERT COIN when no coins are inserted' do
    expect(subject.display).to eq 'INSERT COIN'
  end

  it 'displays 5 cents when a nickel inserted' do
    subject.insertCoin(:nickel)
    expect(subject.display).to eq '0.05'
  end

  it 'displays 15 cents when a nickel and dime are inserted' do
    subject.insertCoin(:nickel)
    subject.insertCoin(:dime)
    expect(subject.display).to eq '0.15'
  end

  it 'displays 25 cents when a quarter is inserted' do
    subject.insertCoin(:quarter)
    expect(subject.display).to eq '0.25'
  end
end
