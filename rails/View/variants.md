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