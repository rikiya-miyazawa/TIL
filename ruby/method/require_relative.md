## require_relativeメソッド  
<br>

- require_relativeメソッド  
```rb
#自分で作成したRubyプログラムを読み込む場合に用いる
#requireは組み込みでない標準ライブラリやgemを読み込む際に使う
#記述するファイルから見て相対パスで読み込む
#../は１つの上のディレクトリを指す
require_relative '../grammar/if.md'
#同じディレクトリ内は直接ファイル名を記述する
require_relative 'find'
```