require_relative "hand" # hand.rbを読み込む

class Dealer < Player  # DealerクラスはPlayerクラスを継承
  def show_one_card  # ディーラーが一枚のカードを見せるメソッド
    hand.cards.first # 手札の最初のカードを返す
  end
end
