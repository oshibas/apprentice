# Dealerクラス（Handクラスの子クラス）
class Dealer < Hand
  # イニシャライザ（オーバーライド）
  def initialize
    super() # 親クラスのイニシャライザを呼び出す
    @hidden = true # カードを隠すかどうかのフラグ（初期値はtrue）
  end

  # ディーラーがカードを引くかどうかを返すメソッド（オーバーライド）
  def hit?
    total < 17 # 合計値が17未満ならtrue、そうでなければfalseを返す
  end

  # カードを隠すかどうかを設定するメソッド
  def hide(hide)
    @hidden = hide # 引数によってフラグを変更する
  end

  # ディーラーの手札の情報を文字列で返すメソッド（オーバーライド）
  def to_s
    if @hidden # カードを隠す場合
      "ディーラーの手札: #{cards[0]} ?" # 最初のカードだけ表示する
    else # カードを隠さない場合
      "ディーラーの手札: #{super}" # 親クラスのメソッドと同じように表示する
    end
  end
end
