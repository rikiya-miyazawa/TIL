## rails g 時の stringカラムのみ省略できる
<br>

- rails g 時の string型のみ省略できる  
```
string型は省略可
通常 bin/rails g model user provider:string uid:string name:string image_url:string
省略 bin/rails g model user provider uid name image_url
```