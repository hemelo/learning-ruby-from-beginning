user_name = ARGV.first
prompt = '> '

puts "Hi #{user_name}."
puts "I'd like to ask you a few questions."
puts "Where do you live #{user_name}? "
print prompt
lives = $stdin.gets.chomp
puts "What kind of computer do you have? ", prompt
computer = $stdin.gets.chomp

# ----------------------------------------------------------------------------------------------------------------------

file_name = ARGV.second
file = open(file_name)

puts "Here's your file #{file_name}"
puts "We're going to erase it"
puts "If you don't want that, hit CTRL-C (^C). Else hit anything"

$stdin.gets

puts "Opening the file..."
target = open(filename, 'w')

puts "Truncating the file.  Goodbye!"
target&.truncate(0)

target&.write("Oh boy\n")
target&.write("It's another day at work\n")
target&.write("Thinking about giving up\n")

puts "And finally, we close it."
target&.close

# ----------------------------------------------------------------------------------------------------------------------
