# 計算機/例外処理
# num1、num2、operatorの3つのパラメータを受け取るcalculateという関数を作成

# num1：整数
# num2：整数
# operator：文字列

class Calculator
  def self.calculate(num1, num2, operator)
    # num1とnum2が整数でない場合は例外を投げる
    unless num1.is_a?(Integer) && num2.is_a?(Integer)
      raise TypeError, "num1、num2には整数を入力してください" # num1、num2 が整数以外の場合
    end
    if num2 == 0 && operator == '/' # ゼロによる割り算の場合は例外を投げる
      raise ZeroDivisionError, "ゼロによる割り算は許可されていません" # num2 が 0 で割り算が実行された場合
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
      raise ArgumentError, "演算子には +、-、*、/ のいずれかを使用してください" # operator が +、-、、/ の場合
    end
  end
end

begin # エラーが発生しうるコード
  puts Calculator.calculate(1, 0, '/')
rescue ZeroDivisionError => e # エラーが発生したときに実行するコード。
  puts e.message # ゼロによる割り算は許可されてない
# else # エラーが発生しなかったときに実行するコード
#   puts "計算が成功しました"
end
# このコードではelse不要。
# 例外が発生しなかった場合には、計算結果がputsメソッドで表示されるため。

begin
  puts Calculator.calculate(1.5, 2, '+')
rescue TypeError => e
  puts e.message # num1、num2には整数を入力してください。
end

begin
  puts Calculator.calculate(1.5, 2, '**')
rescue ArgumentError => e
  puts e.message # 演算子には +、-、*、/ のいずれかを使用してください
end

puts Calculator.calculate(5, 2, '*')
