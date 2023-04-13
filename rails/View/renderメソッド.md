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