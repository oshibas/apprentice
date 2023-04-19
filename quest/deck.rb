# デッキを表すクラス
class Deck
  attr_reader :cards  # デッキ内のカードを読み取るアクセサ

  # カードを初期化
  def initialize
    @cards = build_deck  # デッキを構築
    @cards = [] # カードを生成してデッキに追加
    [:clubs, :diamonds, :spades, :hearts].each do |suit|
      (2..10).each do |number|
        card = Card.new(mark, number)
        # cards << Card.new(suit, number)
        @cards << card
      end
    end
  end

  suits.product(values).map { |suit, value| Card.new(value, suit) }.shuffle
end

# @cardsからランダムに1枚引く。
def draw
  @cards.shuffle!.pop # .popメソッド：配列の最後のカードを取り出して返し、配列からはカードを削除する
end
