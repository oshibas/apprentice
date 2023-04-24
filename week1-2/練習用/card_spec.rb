require_relative 'card'

RSpec.describe Card do

  before do
    suit = "Hearts"
    rank = '8'

    @card = Card.new suit, rank
  end

  it 'should respond to suit' do
    expect(@card).to respond_to(:suit)
  end

  it 'should respond to rank' do
    expect(@card).to respond_to(:suit)
  end

  it 'should respond to show' do
    expect(@card).to respond_to(:show)
  end

end
