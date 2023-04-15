class VendingMachine
  # initialize メソッドを定義。メーカー名（値）を保持するインスタンス変数（@manufacturer_name）に格納
  def initialize(manufacturer_name)
    @manufacturer_name = manufacturer_name
  end

  # メーカー名を返す press_manufacturer_name メソッドを定義
  def press_manufacturer_name
    @manufacturer_name
  end

  # サイダーを出す press_button メソッドを定義
  def press_button
    'cider'
  end
end

# 自動販売機オブジェクトを生成し、メーカー名を指定する
vending_machine = VendingMachine.new('サントリー')

# press_manufacturer_name メソッドを実行し、自動販売機のメーカー名を表示
puts vending_machine.press_manufacturer_name #=> サントリー

# press_button メソッドを実行し、サイダーを表示
puts vending_machine.press_button #=> cider
