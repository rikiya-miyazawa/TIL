## JSONの構築  
<br>

- JSONの構築  
```
jbuilderというgemを使うことができる。
jbuilderを使いことで宣言的にJSONデータを整形できる。
.json.jbuilderという拡張子のビューテンプレートを使用する。
app/views/books/show.json.jbuilder
```
<br>

```rb
#app/controllers/books_controller.rb
def show
  respond_to do |format|
    format.html
    format.json
  end
end

#app/views/books/show.json.jbuilder
json.extract! @book, :id, :name, :price

#http://localhost:3000/books/1.json
{"id":1,"name":"Book 1","price":1000} #app/views/books/show.json.jbuilderで指定した属性の値のみ表示

#json.name_with_id "#{@book.id} - #{@book.name}"
{"id":1,"name":"Book 1","price":1000,"name_with_id":"1 - Book 1"} #name_with_idが追加された


```

