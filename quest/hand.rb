class Hand
  attr_reader :cards

  def initialize
    @cards = [] # カードの配列を空で初期化
  end

  def hit!(deck)
    @cards << deck.cards.shift  # デッキから一枚カードを取り出して手札に加える
  end

  def value
    cards.inject(0){|sum, card| sum += card.value } # 手札のカードの合計値を計算
  end

  def play_as_dealer(deck)
    puts cards.inspect # 手札のカードを表示する
    puts "value #{value}" # 手札の合計値を表示する
    if value < 16
      hit!(deck) # 合計値が16未満ならカードを引く
      play_as_dealer(deck) # 再帰的にこのメソッドを呼び出す
    end
  end
end

# 再帰的なメソッドは、無限に呼び出されるとスタックオーバーフローが発生する可能性がある。そのため、再帰的なメソッドを使う場合は、必ず終了条件を設定する必要がある。今回は value < 16 が条件にあたる。
