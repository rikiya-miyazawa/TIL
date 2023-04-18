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
{"id":1,"name":"Book 1","price":1000}
```

