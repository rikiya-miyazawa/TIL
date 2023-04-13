## renderメソッド  
<br>

- renderメソッド  
```
・描画するためのテンプレートを探す
・見つかったテンプレートをもとにデータを展開し、HTMLを生成する

テンプレートを探索する規約
・RAILS_ROOT/app/views/コントローラ名/アクション名.html.erb
```
<br>

```rb
  def show
    render :show
  end

  #省略可能
  def show
  end
```
<br>
<br>

- JSONやXMLなどその他のフォーマットで表示させることもできる  
```rb
def show
  respond_to do |format|
    format.html
    format.json { render json: @book }
  end
end
```
<br>
<br>

- 様々な形式のrender  
`表2.8参照`
<br>
<br>

- 部分テンプレート(パーシャル)の呼び込み
```
render 'form'のように記述すると、ファイル名が「_」で始まるテンプレートファイルから探索する。
_form.html.erbというファイル名のファイルが探索される。
```