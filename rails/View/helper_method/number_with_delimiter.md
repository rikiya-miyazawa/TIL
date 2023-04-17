## number_with_delimiter  
<br>

- number_with_delimiterヘルパーメソッド  
```
長い数字に対して、区切りの記号を挿入する
オプションで区切り文字を指定することも可能

irb(main):003:0> helper.number_with_delimiter 1234567890
=> "1,234,567,890"
irb(main):004:0> helper.number_with_delimiter 1234567890, delimiter: "~"
=> "1~234~567~890"
```