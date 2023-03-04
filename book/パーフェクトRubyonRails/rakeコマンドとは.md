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
  

