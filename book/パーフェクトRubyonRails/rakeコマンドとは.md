## rakeコマンドとは

makeコマンド風にタスクを実行するためのタスクランナー。  
実行する処理をRakeタスクと呼ぶ。  
  
  

#### Rakefile  
 ```rb
 desc 'Hello, Rake Task'
task :hello do
  puts 'Hello, Rake!'
end
```
<br>
<br>

`desc'...'`  
どのようなタスクかを説明するための設定  
<br>
<br>

`task :hello do`以下  
タスクの名称と実行されるタスクの内容  
<br>
<br>

実際のプロジェクトでは定型処理などを記述する際に活用するケースがある