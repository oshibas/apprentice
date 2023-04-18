# 計算機/例外処理
# num1、num2、operatorの3つのパラメータを受け取るcalculateという関数を作成

class Calculator
  def self.calculate(num1, num2, operator)
    # num1とnum2が整数でない場合は例外を投げる
    unless num1.is_a?(Integer) && num2.is_a?(Integer)
      raise TypeError, "num1、num2には整数を入力してください"
    end
    if num2 == 0 && operator == '/'
      raise ZeroDivisionError, "ゼロによる割り算は許可されていません"
    end
    # 演算子によって計算を実行する
    case operator
    when '+'
      num1 + num2
    when '-'
      num1 - num2
    when '*'
      num1 * num2
    when '/'
      num1 / num2
    else # 有効な演算子でない場合は例外を投げる
      raise ArgumentError, "演算子には +、-、*、/ のいずれかを使用してください"
    end
  end
end

puts "1番目の整数を入力してください:"
num1 = gets.chomp.to_i

puts "2番目の整数を入力してください:"
num2 = gets.chomp.to_i

puts "演算子(+, -, *, /)を入力してください:"
operator = gets.chomp

begin # エラーが発生しうるコード
  result = Calculator.calculate(num1, num2, operator)
  puts "計算結果は #{result} です。"
rescue ZeroDivisionError => e
  puts e.message # エラーが発生したときに実行するコード
rescue TypeError, ArgumentError => e
  puts e.message
end
