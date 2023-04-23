require_relative "card"

class Deck
  attr_reader :cards

  def initialize
    @cards = build_deck
  end

  def build_deck
    # スートと値の組み合わせを生成する
    suits = ["ハート", "ダイヤ", "クラブ", "スペード"].freeze
    values = %w[A 2 3 4 5 6 7 8 9 10 J Q K].freeze
    suits.product(values).map { |suit, value| Card.new(value, suit) }.shuffle
  end

  def draw
    #配列から最後のカードを1枚取り出す。そのカードを配列から削除。
    cards.pop
  end
end
