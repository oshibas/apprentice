require_relative "hand"

class Dealer < Player  # DealerクラスはPlayerクラスを継承
  def show_one_card  # ディーラーが一枚のカードを見せるメソッド
    hand.cards.first
  end
end
