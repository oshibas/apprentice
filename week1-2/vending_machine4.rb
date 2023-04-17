# 4. 単一責任の原則
class VendingMachine
  def initialize(name)
    @name = name
    @balance = 0 # 残高
    @items = [] # アイテムの配列
  end

  # コインを投入するメソッド
  def deposit_coin(coin)
    if coin == 100 # 100円だけOK
      @balance += coin
      puts "#{coin}円を投入しました。残高は#{@balance}円です。"
    else
      puts "#{coin}円は使えません。"
    end
  end

  # ボタンを押すメソッド
  def press_button(item)
    if @items.include?(item) # アイテムが存在するかチェック
      if @balance >= item.price # 残高がアイテムの価格以上かチェック
        @balance -= item.price # 残高を減らす
        puts "#{item.name}が出ました。残高は#{@balance}円です。"
        return item.name # アイテムの名前を返す
      else
        puts "残高が足りません。"
        return "" # 空文字を返す
      end
    else
      puts "そのアイテムはありません。"
      return "" # 空文字を返す
    end
  end

  # アイテムを追加するメソッド
  def add_item(item)
    @items << item # アイテムの配列に追加する
    puts "#{item.name}を追加しました。"
  end

end

# アイテムクラス
class Item
  attr_reader :name, :price # 名前と価格の属性を読み取り可能にする

  # 初期化時に名前と価格を設定する
  def initialize(name, price)
    @name = name
    @price = price
  end

end

# サンプル呼び出し

cola = Item.new('cola', 150) # コーラのアイテムを作成
cider = Item.new('cider', 100) # サイダーも

vending_machine = VendingMachine.new('サントリー') # サントリーの自販機を作成

vending_machine.add_item(cola) # 自販機にコーラ追加
vending_machine.add_item(cider) # サイダーも

vending_machine.deposit_coin(100) # 自販機に100円投入する

puts vending_machine.press_button(cola) # コーラのボタンを押す

vending_machine.deposit_coin(100) # 自販機に100円投入する

puts
