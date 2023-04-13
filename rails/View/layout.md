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