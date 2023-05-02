def default_args(a, b, c = 0, d = 0)
  puts "a=#{a}, b=#{b}, c=#{c}, d=#{d}"
end

default_args(1,2)
default_args(1,2,3)
default_args(1,2,3,4)