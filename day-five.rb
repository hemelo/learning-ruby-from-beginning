require_relative 'helpers'

Helpers.puts_title "Class Inheriting"

class Pet
  attr_accessor :name, :age, :gender, :color
end

class Cat < Pet
end

class Dog < Pet
  def bark
    puts "Woof Woof!"
  end
end

class Snake < Pet
  attr_accessor :length
end

a_dog = Dog.new
a_dog.bark

snake = Snake.new
snake.name = "Jiboia"
snake.length = 5

puts snake.class
puts 100.class
puts "100".class

# ----------------------------------------------------------------------------------------------------------------------

Helpers.puts_title "Kernel vs Object"

Kernel.puts "Hi, i'm puts and I am a Kernel method which is the default module on Ruby"

public def dog_barking
  puts "Woof Woof!"
end

Object.dog_barking

# ----------------------------------------------------------------------------------------------------------------------

Helpers.puts_title "String Methods"

puts "String".capitalize
puts "String".downcase
puts "String".chop
puts "String".reverse
puts "String".sum
puts "String".swapcase
puts "String".upcase
puts "String".upcase.reverse
puts "String".upcase.reverse.chop.next
puts "barbar".sub('bar', 'foo')
puts "foofoo".gsub('foo', 'bar')
puts "foofoo".sub(/foo$/, 'bar')

puts %q!Remembering
about multiline strings!

puts <<ENDSTRING
Remembering about 
multiline strings
ENDSTRING

# ----------------------------------------------------------------------------------------------------------------------

#Helpers.puts_title "Variable names"

x     = 2
y2    = 2
_x    = 2
#7x   = 2
t_est = 2
#te s = 2
#t'i  = 2
#t-i  = 2

# ----------------------------------------------------------------------------------------------------------------------

Helpers.puts_title "Looping"

1.upto(5) do |index|
  puts index
end

5.times do |index|
  puts index
end

0.step(50, 5) do |pos|
  puts pos
end

# ----------------------------------------------------------------------------------------------------------------------

Helpers.puts_title "String Comparison and ASCII Char"

puts "x" > "y"
puts "y" > "x"
puts "a" <=> "b"
puts "b" <=> "a"
puts "a" <=> "a"
puts
puts "x".ord
puts "x".ord.chr
puts
puts "String".chars.map(&:ord).to_s
# ----------------------------------------------------------------------------------------------------------------------

Helpers.puts_title "Iteration with a Regular Expression"

x = "4LPH4 L3G3ND"
x.scan(/./) { |letter| print letter, ' '}
puts
x.scan(/\w\w/) { |two_letters| print two_letters, ' '}
puts
x.scan(/\d+/) {  |number| print number }
puts
x.scan(/[A-Z]/) {  |only_letter| print only_letter }
