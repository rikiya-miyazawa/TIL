## Contents Security Policy  
<br>

- CSP  
```
クロスサイトスクリプティング(XSS)の影響を軽減することを目的とした仕組み
CSPを使うと悪意のあるJavaScriptを無効にできる
Railsではconfig/initializers/content_security_policy.rbに
CSPのデフォルトの設定がコメントアウトで残されている
CSPのnonceという機能でインラインのJavaScriptの設定など細かい設定ができる
```