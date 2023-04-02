require_relative 'helpers.rb'

Helpers.puts_title "MATH ORDER"

puts 3 + 2 + 1 - 5 + 4 % 2 - 1 / 4 + 6

#---------------------------------------------------------------------------------------------------------------------

Helpers.puts_title "FORMATTER"

formatter = "%{first} %{second} %{third} %{fourth}"

puts formatter % {first: 1, second: 2, third: 3, fourth: 4}
puts formatter % {first: "one", second: "two", third: "three", fourth: "four"}
puts formatter % {first: true, second: false, third: true, fourth: false}

puts formatter % {
  first: "I had this thing.",
  second: "That you could type up right.",
  third: "But it didn't sing.",
  fourth: "So I said good night."
}

puts """
Animal List:
\t* Chicken
\t* Horse
\t* Dog
"""

puts "\101"
puts "\x42"

# ----------------------------------------------------------------------------------------------------------------------

Helpers.puts_title "INPUT"

print "How old are you?"
age = gets.chomp.to_i

puts "So, you're #{age} old"

# ----------------------------------------------------------------------------------------------------------------------

Helpers.puts_title "ARGs"

first, second, third = ARGV

puts "First variable: #{first}"
puts "Second variable: #{second}"
puts "Third variable: #{third}"

# ----------------------------------------------------------------------------------------------------------------------

Helpers.puts_title "CLOSURES: Code Block"

outer = 1

def closure_test
  inner = 99
  yield inner
  puts "inner var = #{inner}"
end

closure_test do |inner|
  outer += inner
end

puts "outer var = #{outer}"

# ----------------------------------------------------------------------------------------------------------------------

Helpers.puts_title "CLOSURES: Proc"

outer = 1

def closure_proc_test &block
  inner = 99
  block.call(inner)
  puts "inner var = #{inner}"
  puts "argument is a #{block.class}"
end

closure_proc_test do |inner|
  outer += inner
end

puts "outer var = #{outer}"

# ----------------------------------------------------------------------------------------------------------------------

Helpers.puts_title "CLOSURES: Proc Refactor"

outer = 1

def closure_proc_2_test block
  inner = 99
  block.call(inner)
  puts "inner var = #{inner}"
  puts "argument is a #{block.class}"
end

closure_proc_2_test proc { |inner|
  outer += inner
}

puts "outer var = #{outer}"

# ----------------------------------------------------------------------------------------------------------------------

Helpers.puts_title "CLOSURES: Proc Deferring"

outer = 1

def closure_proc_3_test value
  inner = 99
  puts "inner var = #{inner}"
  proc { inner + value }
end

plwoc = closure_proc_3_test(outer)

puts "outer var = #{outer}"
outer = -100000000
puts "plwoc is a #{plwoc.class}. Is it a lambda? #{plwoc.lambda?}"
puts "changed outer var = #{outer}"
puts "result of deferred execution of outer + inner = #{plwoc.call}"

# ----------------------------------------------------------------------------------------------------------------------

Helpers.puts_title "CLOSURES: Lambdas"

outer = 1

def closure_lambda_test value
  inner = 99
  puts "inner var = #{inner}"
  lambda {inner + value}
end

plwoc = closure_lambda_test(outer)

puts "outer var = #{outer}"
outer = -100000000
puts "plwoc is a #{plwoc.class}. Is it a lambda? #{plwoc.lambda?}"
puts "changed outer var = #{outer}"
puts "result of deferred execution of outer + inner = #{plwoc.call}"

# ----------------------------------------------------------------------------------------------------------------------

Helpers.puts_title "CLOSURES: Procs vs Lambdas"

def returning_a_lambda
  lambda { return "oh boy, returning from lambda"}.call
  "normal method return"
end

def returning_a_proc
  proc { return "oh boy, returning from proc"}.call
  "normal method return"
end

def returning_a_proc_workaround
  proc { next "return oh boy, returning from proc"}.call
  "normal method return"
end

puts returning_a_proc
puts returning_a_proc_workaround
puts returning_a_lambda

l = lambda {|x, y| "#{x}#{y}"}
puts l.call("foo", "bar")
#puts l.call("foo") # Error

plwoc = proc {|x, y| "#{x}#{y}"}
puts plwoc.call "foo", "bar"
puts plwoc.call "foo"

# ----------------------------------------------------------------------------------------------------------------------

Helpers.puts_title "CLOSURES: Syntax Sugar"

puts plwoc.call("foo", "bar")
puts plwoc.call "foo", "bar"
puts plwoc::("foo", "bar")
puts plwoc.("foo", "bar")
puts plwoc["foo", "bar"]

plwoc = proc { |i| i * 2}
print [1, 3, 12].map(&plwoc)

# ----------------------------------------------------------------------------------------------------------------------

def block_message_printer
  message = "Welcome to Block Message Printer"
  if block_given?
    yield
  end
  puts "But in this function/method message is :: #{message}"
end

message = gets
block_message_printer { puts "This message remembers message :: #{message}" }

def proc_message_printer(my_proc)
  message = "Welcome to Proc Message Printer"
  my_proc.call
  puts "But in this function/method message is :: #{message}"
end


my_proc = proc { puts "This message remembers message :: #{message}" }
proc_message_printer(my_proc)

def lambda_message_printer(my_lambda)
  message = "Welcome to Lambda Message Printer"
  my_lambda.call
  puts "But in this function/method message is :: #{message}"
end

my_lambda = -> { puts "This message remembers message :: #{message}" }
lambda_message_printer(my_lambda)
