# Cardクラス
class Card
  # %iはシンボルの配列を作るためのリテラル。スートとは、カードの種類をあらわす記号。SUITS = %i(heart diamond club spade) という部分は、SUITSという定数にスートのシンボルの配列を代入している。
  SUIT = %i(heart diamond club spade)
  Number = ['A', *'2'..'9','10','J','Q','K']

  # 数字とスートのアクセサ
  attr_reader :number, :suit

  def self.generate_cards
    # すべてのスートと数字のカードを生成するメソッド。
    SUITS.product(NUMBERS).map { |suit, n| self.new(suit, n) }
  end

  # イニシャライザ（インスタンス変数の初期化や必要な処理を行うことができるメソッド）
  def initialize(number, suit)
    # Cardクラスのインスタンスは、数字とスートの情報を持つことになる。
    @number = number
    @suit = suit
  end

 # カードの値を返すメソッド
def value
  # 数字と値の対応表をハッシュで定義する
  # 2to9：書かれている数の通りの点数
  # 10,J,Q,K：10点
  # A：1点あるいは11点。手の点数が最大となる方で数える
  values = {"A" => 1, "J" => 10, "Q" => 10, "K" => 10}
  # ハッシュから数字に対応する値を取得する。存在しない場合は数字そのまま
  values[@number] || @number.to_i
end

  # カードの情報を文字列で返すメソッド
  def to_s
    "#{@suit}の#{@number}"
  end
end

# Deckクラス
# class Deck
#   # カードの配列のアクセサ
#   attr_reader :cards

# # イニシャライザ
# def initialize
#   @cards = [] # カードの配列
#   numbers = ("1".."10").to_a + %w[J Q K] # 数字の配列（1から10までとJ,Q,K）
#   suits = %w[♠ ♥ ♦ ♣] # スートの配列（記号）
#   numbers.product(suits) do |number, suit| # 数字とスートの直積を取る
#     @cards << Card.new(number, suit) # 各数字と各スートの組み合わせでカードを生成して配列に追加する
#   end
#   shuffle! # デッキをシャッフルする
# end


  # デッキをシャッフルするメソッド
  def shuffle!

# 手札の合計値を計算するメソッド
def total
  sum = 0 # 合計値を初期化する
  ace_count = 0 # Aの枚数を初期化する
  @cards.each do |card|
    sum += card.value # カードの値を合計値に加える
    ace_count += 1 if card.rank == "A" # Aの枚数をカウントする
  end

  # 合計値が21を超えていて、かつAがある場合、合計値から10を引く（Aを1として扱う）
  while sum > 21 && ace_count > 0
    sum -= 10
    ace_count -= 1
  end

  sum # 合計値を返す
end

# 手札の情報を文字列で返すメソッド
def to_s
  result = "" # 結果の文字列を初期化する
  @cards.each do |card|
    result += card.to_s + " " # 各カードの情報をスペース区切りで追加する
  end
  result += "合計: #{total}" # 合計値を追加する
  result # 結果の文字列を返す
end

# Handクラス（PlayerクラスとDealerクラスの親クラス）
class Hand
  # カードの配列のアクセサ
  attr_reader :cards

  # イニシャライザ
  def initialize
    @cards = [] # カードの配列
  end

  # カードを受け取るメソッド
  def receive(card)
    @cards << card # 配列にカードを追加する
  end

# 手札の合計値を返すメソッド
def total
  sum = @cards.inject(0) { |sum, card| sum + card.value } # カードの値の合計を求める
  ace_count = @cards.count { |card| card.number == "A" } # Aの枚数を数える
  while sum > 21 && ace_count > 0 # 合計値が21を超えていて、かつAがある場合
    sum -= 10 # 合計値から10を引く（Aを1として扱う）
    ace_count -= 1 # Aの枚数を減らす
  end
  sum # 合計値を返す
end

  # 手札がバーストしているかどうかを返すメソッド
  def burst?
    total > 21 # 合計値が21を超えているかどうか

  end

  # 手札の情報を文字列で返すメソッド
  def to_s
    result = "" # 結果の文字列
    @cards.each do |card|
      result += card.to_s + " " # 各カードの情報をスペース区切りで追加する
    end
    result += "合計: #{total}" # 合計値を追加する
    result # 結果の文字列を返す
  end
end

# # Playerクラス（Handクラスの子クラス）
# class Player < Hand
#   # イニシャライザ
#   def initialize(name)
#     super() # 親クラスのイニシャライザを呼び出す
#     @name = name # プレイヤーの名前
#   end
# end

#   # プレイヤーの名前を返すメソッド
#   def name
#     @name # プレイヤーの名前を返す
#   end

#   # プレイヤーがカードを引くかどうかを返すメソッド
#   def hit?
#     puts "#{@name}さん、カードを引きますか？"
#     puts "Y: 引く / N: 引かない"
#     answer = gets.chomp.upcase # 入力を受け取って大文字にする
#     while answer != "Y" && answer != "N" # 入力がYかNでない場合
#       puts "YかNで答えてください。"
#       answer = gets.chomp.upcase # 再入力を受け取る
#     end
#     answer == "Y" # 入力がYならtrue、Nならfalseを返す
#   end

#   # プレイヤーの手札の情報を文字列で返すメソッド（オーバーライド）
#   def to_s
#     "#{@name}さんの手札: #{super}" # 親クラスのメソッドに名前を付け加える
#   end
# end

# # Dealerクラス（Handクラスの子クラス）
# class Dealer < Hand
#   # イニシャライザ（オーバーライド）
#   def initialize
#     super() # 親クラスのイニシャライザを呼び出す
#     @hidden = true # カードを隠すかどうかのフラグ（初期値はtrue）
#   end

#   # ディーラーがカードを引くかどうかを返すメソッド（オーバーライド）
#   def hit?
#     total < 17 # 合計値が17未満ならtrue、そうでなければfalseを返す
#   end

#   # カードを隠すかどうかを設定するメソッド
#   def hide(hide)
#     @hidden = hide # 引数によってフラグを変更する
#   end

#   # ディーラーの手札の情報を文字列で返すメソッド（オーバーライド）
#   def to_s
#     if @hidden # カードを隠す場合
#       "ディーラーの手札: #{cards[0]} ?" # 最初のカードだけ表示する
#     else # カードを隠さない場合
#       "ディーラーの手札: #{super}" # 親クラスのメソッドと同じように表示する
#     end
#   end
# end

# Cardクラス
class Card
  # カードの数字とマークのアクセサ
  attr_reader :number, :suit

  # イニシャライザ
  def initialize(number, suit)
    @number = number # カードの数字
    @suit = suit # カードのマーク
  end

  # カードの値を返すメソッド
  def value
    case @number # カードの数字によって分岐する
    when "A" # Aの場合
      11 # 値は11とする
    when "J", "Q", "K" # J,Q,Kの場合
      10 # 値は10とする
    else # それ以外の場合
      @number.to_i # 数字を整数に変換して値とする
    end
  end

  # カードの情報を文字列で返すメソッド
  def to_s
    "#{@suit}の#{@number}" # マークと数字を組み合わせた文字列を返す
  end
end

# Deckクラス（カードの山札）
class Deck
  # 山札のアクセサ（読み取り専用）
  attr_reader :cards
end

  # イニシャライザ
  def initialize
    @cards = [] # 山札（カードの配列）
    suits = ["ハート", "ダイヤ", "スペード", "クローバー"] # マークの配列
    numbers = (1..13).to_a.map do |n| # 数字の配列（1から13まで）
      case n # 数字によって分岐する
      when 1 # 1の場合
        "A" # Aとする
      when 11 # 11の場合
        "J" # Jとする
      when 12 # 12の場合
        "Q" # Qとする
      when 13 # 13の場合
        "K" # Kとする
      else # それ以外の場合
        n.to_s # 数字を文字列に変換する
      end
    end

    suits.each do |suit| # マークごとに繰り返す
      numbers.each do |number| # 数字ごとに繰り返す
        @cards << Card.new(number, suit) # 新しいカードを作って山札に追加する
      end
    end

    @cards.shuffle! # 山札をシャッフルする！（破壊的メソッド）
  end

  # 山札からカードを一枚引くメソッド
  def draw
    @cards.shift # 配列の先頭の要素を取り出す（山札からカードが減る）
  end

end

# Gameクラス（ブラックジャックのゲーム全体）
class Game

# イニシャライザ
  def initialize
    @deck = Deck.new # 新しい山札を作る
    @player = Player.new("あなた") # 新しいプレイヤーを作る
    @dealer = Dealer.new # 新しいディーラーを作る
  end

  # ゲームを開始するメソッド
  def start
    puts "ブラックジャックへようこそ！"
    puts "ゲームを開始します。"

    # プレイヤーとディーラーにカードを2枚ずつ配る
    2.times do
      @player.receive(@deck.draw)
      @dealer.receive(@deck.draw)
    end

    # プレイヤーの手札とディーラーの手札（一枚隠す）を表示する
    puts @player
    puts @dealer

    # プレイヤーのターン
    player_turn

    # ディーラーのターン（プレイヤーがバーストしていなければ）
    dealer_turn unless @player.burst?

    # 勝敗の判定（プレイヤーとディーラーがバーストしていなければ）
    judge unless @player.burst? || @dealer.burst?
  end

  # プレイヤーのターンを実行するメソッド
  def player_turn
    puts "プレイヤーのターンです。"

    while @player.hit? # プレイヤーがカードを引く限り繰り返す
      # 山札からカードを引いてプレイヤーに渡す
      card = @deck.draw
      puts "あなたに#{card}が配られました。"
      @player.receive(card)

      # プレイヤーの手札と合計値を表示する
      puts @player

      # プレイヤーがバーストしたらループを抜ける
      if @player.burst?
        puts "残念、バーストしてしまいました。"
        break
      end
    end

    puts "プレイヤーのターンは終了です。"
  end

  # ディーラーのターンを実行するメソッド
  def dealer_turn
    puts "ディーラーのターンです。"

    # ディーラーの手札をすべて公開する
    puts "ディーラーの引いていたカードは#{@dealer.cards[1]}でした。"
    @dealer.hide(false) # ディーラーの手札を隠さないようにする
    puts @dealer # ディーラーの手札と合計値を表示する

    while @dealer.hit? # ディーラーがカードを引く限り繰り返す
      # 山札からカードを引いてディーラーに渡す
      card = @deck.draw
      puts "ディーラーに#{card}が配られました。"
      @dealer.receive(card)

      # ディーラーの手札と合計値を表示する
      puts @dealer

      # ディーラーがバーストしたらループを抜ける
      if @dealer.burst?
        puts "ディーラーがバーストしました。"
        break
      end
    end

    puts "ディーラーのターンは終了です。"
  end

  # 勝敗を判定するメソッド
  def judge
    puts "勝敗の判定です。"

    # プレイヤーとディーラーの合計値を比較する
    if @player.total > @dealer.total # プレイヤーの方が高い場合
      puts "あなたの勝ちです！"
    elsif @player.total < @dealer.total # ディーラーの方が高い場合
      puts "あなたの負けです。"
    else # 同じ場合
      puts "引き分けです。"
    end
  end
end

# 新しいゲームを作る
game = Game.new

# ゲームを開始する
game.start
