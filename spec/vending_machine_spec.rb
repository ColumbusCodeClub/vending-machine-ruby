describe VendingMachine do

  context 'when no coins have been inserted' do

    it 'displays INSERT COIN' do
      expect(subject.display).to eq 'INSERT COIN'
    end

    it 'has an empty coin return' do
      expect(subject.coin_return).to be_empty
    end

  end

  context 'when a nickel has been inserted' do

    before :each do
      subject.insertCoin(:nickel)
    end

    it 'has an empty coin return' do
      expect(subject.coin_return).to be_empty
    end

    it 'displays 5 cents' do
      expect(subject.display).to eq '0.05'
    end

  end

  context 'when a dime has been inserted' do

    before :each do
      subject.insertCoin(:dime)
    end

    it 'displays 10 cents' do
      expect(subject.display).to eq '0.10'
    end

  end

  context 'when a quarter has been inserted' do

    before :each do
      subject.insertCoin(:quarter)
    end

    it 'displays 25 cents' do
      expect(subject.display).to eq '0.25'
    end

  end

  it 'adds multiple coins together' do
    subject.insertCoin(:nickel)
    subject.insertCoin(:dime)
    subject.insertCoin(:quarter)
    expect(subject.display).to eq '0.40'
  end

  context 'when an invalid coin is inserted' do
    it 'sends invalid coin to return and display remains unchanged' do
      expect { subject.insertCoin(:penny) }.not_to change { subject.display }
      expect(subject.coin_return).to contain_exactly(:penny)
    end

    it 'sends additional invalid coin to coin return and display remains unchanged' do
      expect do
        subject.insertCoin(:penny)
        subject.insertCoin(:peso)
      end.not_to change { subject.display }
      expect(subject.coin_return).to contain_exactly(:penny, :peso)
    end
  end
end
