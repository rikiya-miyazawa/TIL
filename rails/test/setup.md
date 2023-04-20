## setup  
<br>

- setup  
`minitestで実行前に呼び出される機能。`  
<br>

```rb
#test/controllers/todos_controller_test.rb
class TodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todo = todos(:one)
    puts "call setup"
  end
end

#bin/rails test 実行
#setupが先に実行されている
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