## layout テンプレート  
<br>

- HTML内のheadタグやレイアウト上のヘッダー・フッターの情報などは共通であることがよくある  
```
共通のレイアウトは共通化する
app/views/layouts/application.html.erb

<%= yield%>の部分でそれぞれのページのコンテンツが展開される。

<!DOCTYPE html>
<html>
  <head>
    <title>BookAdmin</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>

    <%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>
    <%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %>
  </head>

  <body>
    <%= yield %>
  </body>
</html>
```
<br>

```
<head>などは共通レイアウト化しているので書かなくてOK
app/views/books/show.html.erb

<h1>書籍の情報</h1>
<p>
  <strong>書籍名:</strong>
  <%= @book.name %>
</p>
<p>
  <strong>価格:</strong>
  <%= @book.price %>
</p>
<p>
  <strong>発売日:</strong>
  <%= @book.published_on.to_s %>
</p>
```