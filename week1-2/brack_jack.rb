# カードを表すクラス
class Card
  # カードのマークと数字を初期化する
  def initialize(mark, number)
    @mark = mark
    @number = number
  end

  # カードの点数を返す
  def point
    # 数字が1から10の場合はその数字を、11以上の場合は10を返す
    if @number <= 10
      @number
    else
      10
    end
  end

  # カードのマークと数字を文字列で返す
  def to_s
    case @number
    when 1
      "A#{@mark}"
    when 11
      "J#{@mark}"
    when 12
      "Q#{@mark}"
    when 13
      "K#{@mark}"
    else
      "#{@number}#{@mark}"
    end
  end
end

# デッキを表すクラス
class Deck
  # カードを初期化する
  def initialize
    @cards = []
    # カードを生成してデッキに追加する
    ['♠', '♣', '♥', '♦'].each do |mark|
      (1..13).each do |number|
        card = Card.new(mark, number)
        @cards << card
      end
    end
  end

  # デッキからカードをランダムに1枚取り出す
  def draw
    @cards.shuffle!.pop
  end
end

# プレイヤーを表すクラス
class Player
  # 手札を初期化する
  def initialize
    @hand = []
  end

  # 手札にカードを加える
  def hit(card)
    @hand << card
  end

  # 手札の点数を計算する
  def point
    total = @hand.map(&:point).sum
    # Aが含まれていて、かつ合計が11以下の場合はAを11として計算する
    if @hand.map(&:to_s).include?('A♠') || @hand.map(&:to_s).include?('A♣') || @hand.map(&:to_s).include?('A♥') || @hand.map(&:to_s).include?('A♦')
      if total <= 11
        total += 10
      end
    end
    total
  end

  # 手札を文字列で返す
  def to_s
    @hand.map(&:to_s).join(', ')
  end
end

# ゲームを表すクラス
class Game
  # ゲームを初期化する
  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Player.new
  end

  # ゲームを開始する
  def start
    puts "ブラックジャックを開始します。"

    # プレイヤーとディーラーにカードを2枚ずつ配る
    2.times do
      @player.hit(@deck.draw)
      @dealer.hit(@deck.draw)
    end
# プレイヤーのターン
while @player.can_hit? do
  @player.hit(@deck.draw)
end

# ディーラーのターン
while @dealer.can_hit? do
  @dealer.hit(@deck.draw)
end

# 勝敗を判定する
if @player.busted?
  puts "Player busted. Dealer wins."
elsif @dealer.busted?
  puts "Dealer busted. Player wins."
elsif @player.hand_value > @dealer.hand_value
  puts "Player wins."
elsif @player.hand_value < @dealer.hand_value
  puts "Dealer wins."
else
  puts "It's a tie."
end
