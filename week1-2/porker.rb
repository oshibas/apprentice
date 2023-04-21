# プレイヤーは2人です

# %記法
def set_deck
  deck = []
  suits = %w(スペード ダイヤ クラブ ハート)
  numbers = %w(1 2 3 4 5 6 7 8 9 10 J Q K A)
  suits.each do |suit|
    numbers.each do |number|
      deck << [suit, number]
    end
  end
  deck
end

def draw_cards(deck, num)
  deck.pop(num)
end

number_cards = 2
deck = set_deck
player_cards = []
player_cards += draw_cards(deck, number_cards)


# カードの生成
module Poker
  def initialize(suit:, number:)
    @suit = suit
    @number = number
  end
end

# カードの実装


# ゲームの実行
def self.play
  new.send(:play)
end
puts "ポーカーを開始します。"
puts "あなたの引いたカードは#{player_cards[0]}です。"
puts "あなたの引いたカードは#{}です。"
puts "ディーラーの引いたカードは#{}です。"
puts "ディーラーの引いたカードは#{}です。"
puts "あなたの役はペアです。"
puts "ディーラーの役はハイカードです。"
