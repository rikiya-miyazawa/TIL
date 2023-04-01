- yieldは手続型オブジェクトに取って代わられる  
```rb
#yieldなし
 def hogehoge( x, &proc )      # &proc
   proc.call if block_given?   # proc.call
   return x + 2
 end
 
 p hogehoge( 3 )
 p hogehoge( 5 ){ p "foo" }


 # --- 結果 ---
 5
 "foo"
 7
```
<br>

```rb
#yieldあり
def hogehoge( x )             # &proc はない！
   yield if block_given?      # proc.call が yield に！
   return x + 2
 end
 
 p hogehoge( 3 )
 p hogehoge( 5 ){ p "foo" }


 # --- 結果 ---
 5
 "foo"
 7
```
<br>
<br>

```rb
around_action :action_logger, only: [:destroy]

def action_logger
  logger.info "around-before"
  yield
  logger.info "around-after"
end
```