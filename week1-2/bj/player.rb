require_relative "hand" # hand.rbを読み込む

class Player
  attr_reader :hand # プレイヤーの手札を読み取るためのメソッド

  def initialize # Playerクラス初期化
    @hand = Hand.new # Handクラスのインスタンスを作成
  end

  def hit(card) # ヒットするときのメソッド
    hand.add_card(card) # 手札にカードを追加する
  end
end
