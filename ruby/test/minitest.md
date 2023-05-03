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

- minitestを使ったテストコードの基本計  
```rb
require 'minitest_autorun'

class SampleTest < Minitest::Test #クラス名はTestで始まるか終わる名前にすることが多い
  def test_sample
    assert_equal 'RUBY', 'ruby'.upcase
  end
end
```