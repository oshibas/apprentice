  # 必要なファイルを読み込む
  require_relative 'deck'
  require_relative 'hand'
  require_relative 'player'
  require_relative 'dealer'

# ゲームを表すクラス
class Game
  # ゲームを初期化する
  def initialize(num_of_players)
    @num_of_players = num_of_players
    @players = Array.new(num_of_players) { Player.new }
    @deck = Deck.new
    @dealer = Dealer.new("ディーラー")
  end

  # ゲームを開始する
  def start
    puts "ブラックジャックを開始します。"
    # カードを配る
    @players.each do |player|
      2.times do
        card = @deck.draw
        player.hit(card)
        puts "#{player.name}の引いたカードは#{card}です。"
      end
      puts "#{player.name}の現在の得点は#{player.point}です。"
    end
    2.times do
      card = @deck.draw
      @dealer.hit(card)
      puts "ディーラーの引いたカードは#{card}です。"
    end
    puts "ディーラーの引いた2枚目のカードはわかりません。"

    # プレイヤーのターン
    @players.each do |player|
      while player.can_hit? do
        puts "#{player.name}の現在の得点は#{player.point}です。カードを引きますか？（Y/N）"
        if gets.chomp.upcase == "Y"
          card = @deck.draw
          player.hit(card)
          puts "#{player.name}の引いたカードは#{card}です。"
        else
          break
        end
      end
      if player.busted?
        puts "#{player.name}はバーストしました。"
      end
    end

    # ディーラーのターン
    puts "ディーラーの引いた2枚目のカードは伏せられています。"
    while @dealer.can_hit? do
      card = @deck.draw
      @dealer.hit(card)
      puts "ディーラーの引いたカードは#{card}です。"
    end
    puts "ディーラーの現在の得点は#{@dealer_point}です。"

    # 結果を表示
    @players.each do |player|
      if player.busted?
        puts "#{player.name}はバーストしています。"
      elsif @dealer.busted?
        puts "#{player.name}の勝ちです！"
      elsif player.point > @dealer.point
        puts "#{player.name}の勝ちです！"
      elsif player.point == @dealer.point
        puts "#{player.name}とディーラーは引き分けです。"
      else
        puts "#{player.name}の負けです。"
      end
    end
    puts "ブラックジャックを終了します。"
  end
end

# プレイヤーを表すクラス
class Player
  attr_reader :hand, :name

  # プレイヤーを初期化する
  def initialize(name = "Player")
    @name = name
    @hand = []
  end

  # カードを手札に加える
  def hit(card)
    @hand << card
  end

  # 手札のポイントを計算する
  def point
    point = 0
    ace_count = 0
    @hand.each do |card|
      if card.value == 1
        point += 11
        ace_count += 1
      elsif card.value >= 10
        point += 10
      else
        point += card.value
      end
    end

    # エースがある場合にポイントを修正する
    while point > 21 && ace_count > 0
      point -= 10
      ace_count -= 1
    end
    point
  end

  # バーストしているかどうかを判定する
  def busted?
    point > 21
  end
end

  #ゲーム開始するメソッド
  game = Game.new(2)
  game.start
