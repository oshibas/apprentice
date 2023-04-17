class VendingMachine
  def initialize(manufacturer_name)
    @manufacturer_name = manufacturer_name
    @amount = 0
  end

  #コインを投入するメソッド
  def deposit_coin(amount)
    if amount == 100
      @amount += amount
    else
      puts "#{amount}円は入りません。100円のみ利用できます。"
    end
  end

  def press_button
    if @amount >= 100
      @amount -= 100
      'cider'
    else
      ''
    end
  end

  private
  def press_manufacturer_name
    @manufacturer_name
  end
end
