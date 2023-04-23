class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def add_card(card)
    cards << card
  end

  # ハンドの合計点数を計算するメソッド
  def points
    total = cards.inject(0) { |sum, card| sum + card.point }
    aces = cards.count { |card| card.value == "A" }

    # エースがあれば、合計が21を超えないように10を引く
    aces.times { total -= 10 if total > 21 }
    total
  end

  # バーストしたかどうかを判定するメソッド
  def busted?
    points > 21
  end
end
