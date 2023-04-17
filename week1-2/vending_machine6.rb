# 6.ポリモーフィズム
class VendingMachine
  def initialize(maker)
    @maker = maker # メーカー名をインスタンス変数に代入
    @money = 0 # 投入金額をインスタンス変数に代入
    @cup = 0 # カップの個数をインスタンス変数に代入
  end

  def deposit_coin(amount)
    @money += amount # 引数で渡された金額を投入金額に加算
  end

  def add_cup(number)
    @cup += number # 引数で渡された個数をカップの個数に加算
  end

  def press_button(item)
    if item.get_price <= @money # アイテムの値段が投入金額以下であれば
      if item.is_a?(CupCoffee) && @cup > 0 # アイテムがカップコーヒーでカップがあれば
        @money -= item.get_price # 投入金額からアイテムの値段を引く
        @cup -= 1 # カップの個数を1減らす
        return "#{item.get_name} #{item.get_type} #{item.get_temperature}" # アイテムの名前と種類と温度を返す
      elsif item.is_a?(Drink) # アイテムがドリンクであれば
        @money -= item.get_price # 投入金額からアイテムの値段を引く
        return "#{item.get_name} #{item.get_type}" # アイテムの名前と種類を返す
      elsif item.is_a?(Snack) # アイテムがスナックであれば
        @money -= item.get_price # 投入金額からアイテムの値段を引く
        return "#{item.get_name}" # アイテムの名前を返す
      else # アイテムがどれでもなければ
        return "" # 空文字を返す
      end
    else # アイテムの値段が投入金額より高ければ
      return "" # 空文字を返す
    end
  end
end

class Item
  def initialize(name, price)
    @name = name # 商品名をインスタンス変数に代入
    @price = price # 値段をインスタンス変数に代入
  end

  def get_name
    @name # 商品名を返す
  end

  def get_price
    @price # 値段を返す
  end
end

class Drink < Item # Itemクラスを継承したDrinkクラス
  def initialize(name, price, type)
    super(name, price) # Itemクラスのinitializeメソッドを呼び出す
    @type = type # 飲み物の種類をインスタンス変数に代入
  end

  def get_type
    @type # 飲み物の種類を返す
  end
end

class CupCoffee < Drink # Drinkクラスを継承したCupCoffeeクラス
  def initialize(name, price, type, temperature)
    super(name, price, type) # Drinkクラスのinitializeメソッドを呼び出す
    @temperature = temperature # 温度をインスタンス変数に代入
  end

  def get_temperature
    @temperature # 温度を返す
  end
end

class Snack < Item # Itemクラスを継承したSnackクラス
  def initialize(name = "potato chips", price = 150) # デフォルト引数を設定
    super(name, price) # Itemクラスのinitializeメソッドを呼び出す
  end
end
