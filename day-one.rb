Helpers.puts_title "STRING STRIP"

data_test =  "      DATA TEST      "
puts data_test.rstrip
puts data_test.strip()
puts data_test
puts data_test.strip!
puts data_test

# ----------------------------------------------------------------------------------------------------

Helpers.puts_title "HASH and EACH"

books =  Hash["Harry Potter" => :bad, "Benjamin Button" => :bad, "O Poder do Hábito" => :good]
classifications = Hash.new {0}

books.values.each do |classification|
  classifications[classification] += 1
end

puts classifications

# ----------------------------------------------------------------------------------------------------

Helpers.puts_title "REPEATED SCOPE"

def print_index (number)
  number.times do |data|
    puts data
  end
end

print_index 5

