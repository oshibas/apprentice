#自動販売機のクラス VendingMachine を宣言
class VendingMachine
  #press_button メソッドを実行すると 'cider' の文字列を返す
  def press_button
    'cider'
  end
end

#自動販売機オブジェクトを生成
vending_machine = VendingMachine.new
#press_button メソッドを実行し、'cider' を返す
puts vending_machine.press_button

=begin
インスタンスとは：オブジェクト指向プログラミングにおいて、クラスを実体化したものです。クラスはオブジェクトの設計図であり、インスタンスはその設計図に基づいて作成された具体的なオブジェクトです。

自動販売機クラス：自動販売機クラスを設計し、具体的な自動販売機を作成するためには、自動販売機クラスのインスタンスを生成する必要があります。
end
