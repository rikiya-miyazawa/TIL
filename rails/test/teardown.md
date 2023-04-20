## teardown  
<br>

- teardown  
`minitestで実行後に呼び出される機能。`  
<br>

```rb
#test/controllers/todos_controller_test.rb
class TodosControllerTest < ActionDispatch::IntegrationTest
  teardown do
    puts "call teardown"
  end
end

#bin/rails test 実行
#teardownが後に実行されている
Running:
call setup
call teardown
.call setup
call teardown
.call setup
call teardown
.call setup
call teardown
.call setup
call teardown
.call setup
call teardown
.call setup
call teardown
```