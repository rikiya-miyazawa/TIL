## factory_bot_rails  
<br>

- gem 'factory_bot_rails'  
```
テストデータを作成するためのfactory_botを使用するためのgem
利用すると、Railsのディレクトリ構成に合わせて自動で読み込むパスが指定されたり、
rails generateコマンドで生成するファイルをfixtureからfactory_botのものに自動で変更するなどのサポートが得られる
```
<br>
<br>

- bin/rails g factory_bot:model モデル名  
```
factory_bot_railsをインストールしている状態であれば、
bin/rails g コマンド実行の際にfactory_bot用のファイルも生成される

モデルなどのプロダクトコードがすでに生成されている場合はfactory_bot用のファイルのみを生成するコマンドを実行する
bin/rails g factory_bot:model モデル名
```