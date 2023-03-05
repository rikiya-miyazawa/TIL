## bundleコマンドとは  
<br>

```
gemパッケージの仕組みを利用して「開発しているプロジェクト内でどのgemパッケージを使っているのか」、
「どのバージョンを使用しているのか」を明示する仕組みを提供する。

bundleコマンドはBundlerというライブラリ名。
Bundlerを使って使用するgemパッケージをまとめるにはGemfileにgem名を記載する。
gemのバージョンや依存関係を解決した結果をGemfile.lockとして保存する
```
<br>
<br>

#### よく使われるBundlerのサブコマンド  
<br>

***bundleGemfileに書かれているgemインストールのコマンド***  
`bundle install`  
<br>
<br>

***bundleインストール済みのgem更新のコマンド***  
`bundle update <ライブラリ(gem)名>`  
<br>
<br>

***bundleインストール済みのgem一覧表示のコマンド***  
`bundle list`  
<br>
<br>

***bundleGemfileを生成するコマンド***  
`bundle init`  
<br>
<br>

***bundleBundlerでインストールされているgemを使用してコマンドを実行するコマンド***  
`bundle exec <コマンド名>`  
<br>
<br>

```
Gemfileに必要なgemを記載しておくことで、
特定のプロジェクトでのみ利用するgemを簡単に管理できる。
```
<br>
<br>

