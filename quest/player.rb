# Playerクラス（Handクラスの子クラス）
class Player < Hand
  # イニシャライザ
  def initialize(name)
    super() # 親クラスのイニシャライザを呼び出す
    @name = name # プレイヤーの名前
  end
end

  # プレイヤーの名前を返すメソッド
  def name
    @name # プレイヤーの名前を返す
  end

  # プレイヤーがカードを引くかどうかを返すメソッド
  def hit?
    puts "カードを引きますか？ (Y/N)"
    answer = gets.chomp.upcase # 入力を受け取って大文字にする
    while answer != "Y" && answer != "N" # 入力がYかNでない場合
      puts "YかNで答えてください。"
      answer = gets.chomp.upcase # 再入力を受け取る
    end
    answer == "Y" # 入力がYならtrue、Nならfalseを返す
  end

  # プレイヤーの手札の情報を文字列で返すメソッド（オーバーライド）
  def to_s
    "#{@name}さんの手札: #{super}" # 親クラスのメソッドに名前を付け加える
  end
