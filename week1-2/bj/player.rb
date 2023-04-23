require_relative "hand"

class Player
  attr_reader :hand

  def initialize # Playerクラス初期化
    @hand = Hand.new
  end

  def hit(card)
    hand.add_card(card)
  end
end
