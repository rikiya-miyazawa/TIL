## Slim  
<br>

- Slim  
```
Slimは、Hamlよりもさらにシンプルな表記ができるテンプレートエンジン。
使用するにはgemをインストールする必要がある。
単にテンプレートエンジンとして使用する場合は「Slim」のみ、
ジェネレーターが生成するテンプレートエンジンも変更したい場合は「slim-rails」を使用する。
「slim-rails」を使用する場合は「slim」はインストールしなくてOK。
```
<br>

```
「%」必要ない

doctype html
html
  head
    title Hi
  body
    h1 id="headre" Header
      - 3.times do
        p Item
        
2-5-3参照
```