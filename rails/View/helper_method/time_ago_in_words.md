## time_ago_in_words  
<br>

- time_ago_in_wordsヘルパーメソッド  
```
ある時刻と現在の時刻の間にどの程度開きがあるかを、人間にとってわかりやすく表示するヘルパーメソッド
<%= time_ago_in_words(Time.current) %>

irb(main):001:0> helper.time_ago_in_words(Time.current)
=> "less than a minute"
irb(main):002:0> helper.time_ago_in_words(Time.current + 3.days)
=> "3 days"
```