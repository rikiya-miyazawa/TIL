## minitest  
<br>

- minitest  
```
Railsのデフォルトのテスティングフレームワークでもある
テスト自動化の手順
1.テスティングフレームワークのルールにそってテストコードを書く
2.上記1で作ったテストコードを実行する
3.テスティングフレームワークが実行結果をチェックし、その結果が正しいか間違っているかを報告する
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

```