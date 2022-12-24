require 'rspec'
require './counter'

describe 'counter' do
  it 'creates independent counter instances' do
    counter1 = counter(10)
    counter2 = counter(20)

    expect(counter1[0].call).to eq(10)
    expect(counter2[0].call).to eq(20)

    counter1[1].call
    counter2[1].call

    expect(counter1[0].call).to eq(11)
    expect(counter2[0].call).to eq(21)
    expect(counter1[1].call).to eq(12)
  end

  it 'uses 0 as the default initial value' do
    counter = counter()
    expect(counter[0].call).to eq(0)
  end
end
