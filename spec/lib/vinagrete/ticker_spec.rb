describe Vinagrete::Ticker do
  it 'calculates remaining minutes' do
    expect(subject.calculate_remaining_minutes(0)).to eq(1)
  end

  it 'calculates remaining seconds' do
    expect(subject.calculate_remaining_seconds(45, 0)).to eq(15)
    expect(subject.calculate_remaining_seconds(80, 1)).to eq(40)
  end

  it 'displays minutes' do
    expect(subject.minutes_to_display(1)).to eq('00')
    expect(subject.minutes_to_display(0)).to eq('00')
    expect(subject.minutes_to_display(5)).to eq('04')
    expect(subject.minutes_to_display(15)).to eq('14')
  end

  it 'displays seconds' do
    expect(subject.seconds_to_display(1)).to eq('01')
    expect(subject.seconds_to_display(0)).to eq('00')
    expect(subject.seconds_to_display(5)).to eq('05')
    expect(subject.seconds_to_display(15)).to eq('15')
  end
end
