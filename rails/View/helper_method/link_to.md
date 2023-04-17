## link_to  
<br>

- link_toはaタグを生成するヘルパーメソッド  
```rb
link_to("profile link", edit_profile_path)
#=> <a href="/profile/edit">profile link</a>

#コントローラとアクションを指定することも可能
link_to("profile link", controller: :profiles, action: :edit)
#=> <a href="/profile/edit">profile link</a>

#クエリストリングを付与することも可能
link_to("profile link", controller: :profiles, action: :edit, id: 1234, detailed: "true")
#=> <a href="/profile/edit?detailed=true&id=1234">profile link</a>
```