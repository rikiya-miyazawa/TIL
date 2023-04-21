## test  
<br>

- test実行のコマンド  
`bin/rails test`
<br>
<br>

- より詳細なテスト結果の表示  
`bin/rails test -v`
<br>
<br>

- ディレクトリを指定してテストを実行する
`bin/rails test test/models`
<br>
<br>

- ファイル指定
`bin/rails test test/models/todo_test.rb`
<br>
<br>

- 特定の行を指定
`bin/rails test test/models/todo_test.rb:5`
<br>
<br>

- 特定のテスト名を指定
`bin/rails test test/models/todo_test.rb -n test_the_truth`
<br>
<br>

- 並列度を変更する  
```rb
#test/test_helper.rb
#並列度を1に変更

#通常は並列度4 #sleep 3 * 4
parallelize(workers: :number_of_processors)
#Finished in 3.341445s

#並列度1に指定すると12sかかる
parallelize(workers: 1)
#Finished in 12.251387s
```