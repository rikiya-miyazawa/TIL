## variants  
<br>

- 条件によってテンプレートを切り替える機構  
```
接続してきた端末によって、PCとは別のテンプレートを表示したい場合に有効
:tabletや:mobileなどの値を入力して切り替える
```
<br>

```
app/controllers/application_controller.rb

class ApplicationController < ActionController::Base
  before_action :detect_mobile_variant

  private

  def detect_mobile_variant
    request.variant = :mobile if request.user_agent =~ /iPhone/
  end
end
```
<br>
<br>

```
mobileのViewなどは新しく用意する
app/views/books/show.html+mobile.erb

<h1>書籍の情報(for mobile)</h1>
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