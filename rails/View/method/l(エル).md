## l(エル)メソッド  
<br>

- i18n用の定義を利用して日時に関するオブジェクトを特定のフォーマットに変換するメソッド  
```
localizeメソッドのエイリアス

%h5.card-header 開催時間
  .card-body
    %p.card-text= "#{l(@event.start_at, format: :long)} - #{l(@event.end_at, format: :long)}"

#{l(@event.start_at, format: :long)}で
複数のオブジェクトを統一したフォーマットに変換しやすくなる
format: :longでいくつかある日時フォーマットの定義のlongを選択している
#{(@event.strftime("%Y/%m/%d %H:%M"))}のようにstrftimeメソッドでも同じ結果が得られるが、
lメソッドを利用することで複数のオブジェクトを統一したフォーマットに変換しやすくなる
```