## minitest  
<br>

- minitest  
```
Railsのデフォルトのテスティングフレームワークでもある
テスト自動化の手順
1.テスティングフレームワークのルールにそってテストコードを書く
2.上記1で作ったテストコードを実行する
3.テスティングフレームワークが実行結果をチェックし、その結果が正しいか間違っているかを報告する

minitest実行時のエラー回避オプションコマンド  --no-plugins
```
<br>

- minitestを使ったテストコードの基本形  
```rb
#テストコードが書かれているファイル名はクラス名と合わせる(スネークケース)
require 'minitest_autorun'

class SampleTest < Minitest::Test #クラス名はTestで始まるか終わる名前にすることが多い
  def test_sample #minitestはtest_で始まるメソッドを探してそれを実行する
    assert_equal 'RUBY', 'ruby'.upcase #assert_equal 期待する結果, テスト対象となる値や式
  end
end
```
<br>
<br>

- minitestの検証メソッド  
```rb
#aがbと等しければパスする
assert_equal b, a
#aが真であればパスする
assert a
#aが偽であればパスする
refute a
```
<br>
<br>

- 実行結果  
```
. テストメソッド１つにつき.ひとつ
runs 実行したテストメソッドの件数
assertions 実行した検証メソッドの件数
failures 検証に失敗したテストメソッドの件数
errors 検証中にエラーが発生したテストメソッドの件数
skips skipメソッドにより実行をスキップされたテストメソッドの件数
```
<br>

- 失敗時  
```
失敗やエラーが出た箇所でそのメソッドは離脱して次のメソッドのテストを実行する
F Failure 実行結果が失敗
失敗の詳細
Expected: 期待した結果
Actual: 実際の結果
```

<br>
<br>

- Fizz Buzzのテストコード  
```rb
def fizz_buzz(n)
  if n % 15 == 0
    'Fizz Buzz'
  elsif n % 3 == 0
    'Fizz'
  elsif n % 5 == 0
    'Buzz'
  else
    n.to_s
  end
end

require 'minitest/autorun'

class FizzBuzzTest < Minitest::Test
  def test_fizz_buzz
    assert_equal '1', fizz_buzz(1)
    assert_equal '2', fizz_buzz(2)
    assert_equal 'Fizz', fizz_buzz(3)
    assert_equal '4', fizz_buzz(4)
    assert_equal 'Buzz', fizz_buzz(5)
    assert_equal 'Fizz', fizz_buzz(6)
    assert_equal 'Fizz Buzz', fizz_buzz(15)
  end
end

# Run options: --seed 35120

# Running:

.

# Finished in 0.000835s, 1197.6047 runs/s, 8383.2328 assertions/s.
# 1 runs, 7 assertions, 0 failures, 0 errors, 0 skips
```