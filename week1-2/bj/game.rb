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
    puts "ブラックジャックを開始します。"
    puts "♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣\n"

    # 最初のカードを配る
    deal_initial_cards

    # プレイヤーが最初に引いた2枚のカードを表示する
    puts "あなたの引いた1枚目のカードは#{player.hand.cards[0]}です。"
    puts "あなたの引いた2枚目のカードは#{player.hand.cards[1]}です。\n"

    # ディーラーの1枚目のカードを表示する
    puts "ディーラーの引いたカードは#{dealer.show_one_card}です。\n"

    # ディーラーの2枚目のカードは伏せておく
    puts "ディーラーの引いた2枚目のカードはわかりません。\n"

    # プレイヤーがカードを引くかどうかを尋ねる
    loop do
      puts "あなたの現在の得点は#{player.hand.points}です。"
      puts "カードを引きますか？（y/n）\n"
      decision = gets.chomp.downcase
      break if decision == "n"

      if decision == "y"
        # カードを引く
        card = deck.draw
        player.hit(card)
        puts "あなたの引いたカードは#{card}です。\n"

        # バーストしたかどうかをチェック
        break if player.hand.busted?
      end
    end

    # プレイヤーがバーストした場合
    if player.hand.busted?
      puts "あなたの現在の得点は#{player.hand.points}です。"
      puts "あなたはバーストしました。\n"
      puts "残念！！あなたは負けてしまいました。\n"

    # プレイヤーがバーストしなかった場合
    else
      # ディーラーの2枚目のカードを表示する
      puts "ディーラーの引いた2枚目のカードは#{dealer.hand.cards[1]}でした。"
      puts "ディーラーの現在の得点は#{dealer.hand.points}です。\n"

      # ディーラーのポイントが17以上になるまでループ
      while dealer.hand.points < 17
        card = deck.draw
        dealer.hit(card)
        puts "ディーラーの引いたカードは#{card}です。"
        puts "ディーラーの現在の得点は#{dealer.hand.points}です。\n"
      end

      # ディーラーがバーストしたかどうかを確認する
      if dealer.hand.busted?
        puts "ディーラーの得点は#{dealer.hand.points}です。\n"
        puts "あなたの勝ちです！おめでとうございます！！\n"

      elsif player.hand.points > dealer.hand.points
        puts "あなたの得点は#{player.hand.points}です。"
        puts "ディーラーの得点は#{dealer.hand.points}です。\n"
        puts "あなたの勝ちです！おめでとうございます！！\n"

      elsif player.hand.points < dealer.hand.points
        puts "あなたの得点は#{player.hand.points}です。"
        puts "ディーラーの得点は#{dealer.hand.points}です。\n"
        puts "残念！！あなたは負けてしまいました。\n"

      else
        puts "おっと。引き分けです。\n"

      end
      puts "♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣"
      puts "ブラックジャックを終了します。"
      puts "♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣ ♠ ♥ ♦ ♣"
    end

    def ask_replay?
      answer = ''
      puts 'もう一度プレイしますか？(y/n)\n'
      loop do
        answer = gets.chomp.downcase
        break if answer == 'n' || answer == 'y'
      end
      answer == 'y'
    end

  end
end
