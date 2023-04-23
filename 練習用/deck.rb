# カードを表すクラス
class Card
  attr_reader :mark, :number  # カードのマークと数字を読み取るアクセサ

  # カードを初期化
  def initialize(mark, number)
    @mark = mark
    @number = number
  end

  # カードの点数を返す
  def point
    if @number > 10
      10
    elsif @number == 1
      11
    else
      @number
    end
  end
end

# デッキを表すクラス
class Deck
  attr_reader :cards  # デッキ内のカードを読み取るアクセサ

  # カードを初期化
  def initialize
    @cards = build_deck  # デッキを構築
  end

  # デッキを構築する
  def build_deck
    cards = []
    [:clubs, :diamonds, :spades, :hearts].each do |mark|
      (1..13).each do |number|
        card = Card.new(mark, number)
        cards << card
      end
    end
    cards.shuffle!
  end

  # @cardsからランダムに1枚引く。
  def draw
    @cards.shuffle!.pop # .popメソッド：配列の最後のカードを取り出して返し、配列からはカードを削除する
  end
end

# プレイヤーを表すクラス
class Player
  attr_reader :hand, :name  # 手札と名前を読み取るアクセサ

  # プレイヤーを初期化
  def initialize(name="プレイヤー")
    @name = name
    @hand = []  # 手札を初期化
  end

  # カードを手札に加える
  def add_card(card)
    @hand << card
  end

  # 手札の点数を返す
  def point
    # エースを持っているかどうかで場合分け
    if @hand.any? { |card| card.number == 1 } && @hand.sum(&:point) <= 11
      # エースを1として数えた場合の合計が11以下なら、エースを11として数える
      @hand.sum { |card| card.number == 1 ? 11 : card.point }
    else
      @hand.sum(&:point)
    end
  end
end

# ゲームを表すクラス
class Game
  # ゲームを初期化する
  def initialize(num_of_players)
    @num_of_players = num_of_players
    @players = Array.new(num_of_players) { Player.new }
