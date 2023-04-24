require_relative 'deck'
require_relative 'hand'
require_relative 'player'
require_relative 'dealer'


# ゲームを表すクラス
class Game
  # ゲームを初期化
  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Player.new
  end
end

# カードの点数を返す
def point
    # 数字が1から10の場合はその数字を、11以上の場合は10を返す
    if @number <= 10
      @number
    elsepw
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
  attr_reader :hand

  # もう1枚カードを引いてもよいかどうかを判定する
def can_hit?
  point < 17
end


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
    # Aが含まれていて、かつ合計が11以下の場合はAを11として計算
    if @hand.map(&:to_s).include?('A♠') || @hand.map(&:to_s).include?('A♣') || @hand.map(&:to_s).include?('A♥') || @hand.map(&:to_s).include?('A♦')
      if total <= 11
        total += 10
      end
    end
    total
end

# バーストしたかどうかを判定
def busted?
    point > 21
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
  puts "ブラックジャックカードを開始します。"

# プレイヤーとディーラーにカードを2枚ずつ配る
2.times do
  @player.hit(@deck.draw)
end
2.times do
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

# 勝敗を判定
if @player.busted?
  puts "あなたはバーストしました。あなたの負けです！"
elsif @dealer.busted?
  puts "ディーラーがバーストしました。あなたの勝ちです！"
elsif @player.point > @dealer.point
  puts "あなたの勝ちです！"
elsif @player.point < @dealer.point
  puts "あなたの負けです！"
else
  puts "引き分けです！"
end
end
end

puts 'ブラックジャックを終了します。'
