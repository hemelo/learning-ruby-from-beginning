require_relative 'helpers'

Helpers.puts_title "Array"

x = [1, 2, 3, 4]
puts x.pop
puts x.pop
puts x.length
puts x.join
puts x.join '-'
puts x.inspect

puts "Testing Join".scan(/\w/).join ','
puts "One sentence. Two sentences".split(/\.\s*/).inspect
p "Words with lots of spaces".split(/\s+/)
[1, "test", 2, 3, 4].each { |element| puts element.to_s}
[1, 2, 3, 4].collect { |element| element * 2 }

#DONT
data = [1,2,3,4]
i = 0

while i < data.length
  puts data[i].to_s + "x"
  i += 1
end

p ["a", "b", "c"] + ["d", "e", "f"]
p %w[a b c] + %w[d e f]
p ["a", "b", "c"] - ["c", "e", "a"]
p %w[a b c] - %w[c e a]

abc = ["a", "b", "c"]

p abc.include? "a"
p abc.first
p abc.last
puts abc.first(2).join "-"
puts abc.reverse

# ######################################################################################################################

Helpers.puts_title "Hashes"

dictionary = {'cat' => 'feline', 'dog' => 'canine'}
puts dictionary.size
puts dictionary.inspect
puts dictionary['cat']
p dictionary
p dictionary.keys
p dictionary.values
dictionary.delete 'cat'

some_values = { "a" => 100, "b" => 20}
some_values.delete_if {|k, v| v < 25}

people = {
  'fred' => {
    'name' => 'Fred E.',
    'age' => 21,
    'gender' => 'male',
    'skills' => %w[communication productive]
  },
  'margareth' => {
    'name' => 'Margareth S.',
    'age' => 72,
    'gender' => 'female',
    'skills' => %w[smart intelligent]
  }
}

puts people['fred']['age']
puts people['fred']['skills'].collect(&:capitalize).join ", "

unless people['fred']['age'] >= 20
  puts "Fred is too young"
end

puts "Fred is a #{people['fred']['age'] < 18 ? "child" : "adult"}"

# ######################################################################################################################

Helpers.puts_title "Switch Case"

fruit = "orange"


color = case fruit
        when "orange"
          "orange"
        when "green"
          "green"
        when "banana"
          "yellow"
        else
          "unknown"
        end

# ######################################################################################################################

Helpers.puts_title "Until"

x = 1
until x > 99
  puts x
  x = x * 2
end

# ######################################################################################################################

Helpers.puts_title "Remembering Code Block"

def each_vowel(&code_block)
  %w{a e i o u}.each {|vowel| code_block.call(vowel)}
end

each_vowel { |vowel| puts vowel}

def each_vowel_2
  %w{a e i o u}.each {|vowel| yield (vowel)}
end

each_vowel_2 { |vowel| puts vowel}

print_parameter_to_screen = lambda { |thing| puts thing }
print_parameter_to_screen.call(100)

# ######################################################################################################################

Helpers.puts_title "Dates and Times"

# <2.4 Fixnum
class Integer
  def seconds
    self
  end

  def minutes
    self * 60
  end

  def hours
    self * 60 * 60
  end

  def days
    self * 60 * 60 * 24
  end
end


puts Time.now
puts Time.now - 10
puts Time.now + 86400
puts Time.now + 10.minutes
puts Time.local(2003, "Sep", 25)
puts Time.local(2003, 9, 25, 12, 0, 0)
puts Time.gm(2003, 9, 25, 12, 0, 0)
puts Time.utc(2003, 9, 25, 12, 0, 0)
puts Time.utc(2003, 9, 25, 12, 0, 0) == Time.gm(2003, 9, 25, 12, 0, 0)

epoch_time = Time.gm(2007, 5).to_i
t = Time.at(epoch_time)
puts "#{t.year}-#{t.month}-#{t.day} - Day #{t.yday} of the year - Timezone #{t.zone}"

# ######################################################################################################################

Helpers.puts_title "Big Numbers"

# <2.4 Fixnum::MAX / Bignum::MAX
# > Unified in Integer
puts Float::MAX
puts Float::INFINITY

# ######################################################################################################################

Helpers.puts_title "Range"

puts ('A'..'Z').inspect
puts ('A'..'Z').include?('R')
puts (1..100).count

# ######################################################################################################################

Helpers.puts_title "Symbols reduces memory consumption"

current_situation = :good
puts "Everything is fine" if current_situation == :good

person1 = { :name => "Fred", :age => 20, :gender => :male }