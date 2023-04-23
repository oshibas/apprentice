require_relative "player"
require_relative "dealer"
require_relative "deck"
require_relative "card"

class Game
  attr_reader :player, :dealer, :deck

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  # ディーラーがカードを2枚引く
  def deal_initial_cards
    2.times do
      player.hit(deck.draw)
      dealer.hit(deck.draw)
    end
  end

  # ゲームを開始
  def play
    puts "♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣"
    puts ""
    puts "ブラックジャックを開始します。"
    puts ""
    puts "♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣"
    puts ""

    # 最初のカードを配る
    deal_initial_cards

    # プレイヤーが最初に引いた2枚のカードを表示する
    puts "あなたの引いた1枚目のカードは#{player.hand.cards[0]}です。"
    puts ""
    puts "あなたの引いた2枚目のカードは#{player.hand.cards[1]}です。"
    puts ""

    # ディーラーの1枚目のカードを表示する
    puts "ディーラーの引いたカードは#{dealer.show_one_card}です。"
    puts ""

    # ディーラーの2枚目のカードは伏せておく
    puts "ディーラーの引いた2枚目のカードはわかりません。"
    puts ""

    # プレイヤーがカードを引くかどうかを尋ねる
    loop do
      puts "あなたの現在の得点は#{player.hand.points}です。"
      puts ""
      puts "カードを引きますか？（Y/N）"
      puts ""
      decision = gets.chomp.downcase
      break if decision == "n"

      if decision == "y"
        # カードを引く
        card = deck.draw
        player.hit(card)
        puts "あなたの引いたカードは#{card}です。"
        puts ""

        # バーストしたかどうかをチェック
        break if player.hand.busted?
      end
    end

    # プレイヤーがバーストした場合
    if player.hand.busted?
      puts "あなたの現在の得点は#{player.hand.points}です。"
      puts ""
      puts "あなたはバーストしました。"
      puts ""
      puts "残念！！あなたは負けてしまいました。"
      puts ""

    # プレイヤーがバーストしなかった場合
    else
      # ディーラーの2枚目のカードを表示する
      puts "ディーラーの引いた2枚目のカードは#{dealer.hand.cards[1]}でした。"
      puts ""
      puts "ディーラーの現在の得点は#{dealer.hand.points}です。"
      puts ""

      # ディーラーのポイントが17以上になるまでループ
      while dealer.hand.points < 17
        card = deck.draw
        dealer.hit(card)
        puts "ディーラーの引いたカードは#{card}です。"
        puts ""
        puts "ディーラーの現在の得点は#{dealer.hand.points}です。"
        puts ""
      end

      # ディーラーがバーストしたかどうかを確認する
      if dealer.hand.busted?
        puts "ディーラーの得点は#{dealer.hand.points}です。"
        puts ""
        puts "あなたの勝ちです！おめでとうございます！！"
        puts ""

      elsif player.hand.points > dealer.hand.points
        puts "あなたの得点は#{player.hand.points}です。"
        puts ""
        puts "ディーラーの得点は#{dealer.hand.points}です。"
        puts ""
        puts "あなたの勝ちです！おめでとうございます！！"
        puts ""

      elsif player.hand.points < dealer.hand.points
        puts "あなたの得点は#{player.hand.points}です。"
        puts ""
        puts "ディーラーの得点は#{dealer.hand.points}です。"
        puts ""
        puts "残念！！あなたは負けてしまいました。"
        puts ""

      else
        puts "おっと。引き分けです。"
        puts ""

      end
      puts "♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣"
      puts ""
      puts "ブラックジャックを終了します。"
      puts ""
      puts "♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣"
    end

    def ask_replay?
      answer = ''
      puts 'もう一度プレイしますか？(y/n)'
      loop do
        answer = gets.chomp.downcase
        break if answer == 'n' || answer == 'y'
      end
      answer == 'y'
    end

  end
end
