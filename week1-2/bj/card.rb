class Card
  # カードの値とスートを読み取るためのメソッド
  attr_reader :value, :suit

  # カードの初期化
  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  # カードの文字列表現
  def to_s
    "#{suit}の#{value}"
  end

  # カードのポイント
  def point
    case value
    when "A" then 11
    when "K", "Q", "J" then 10
    else value.to_i
    end
  end
end
