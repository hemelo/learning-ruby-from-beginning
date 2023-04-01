def get_shakey()
  Hash["William Shakespeare" => Hash[1 => Hash["title" => "The Two Gentlemen of Verona", "year" => 1591 ], 2 => Hash[ "title" => "The Taming of the Shrew", "year" => 1591 ]]]
end

def print_plays(year_from, year_to)
  get_shakey["William Shakespeare"]
    .select { |_, value|
      value["year"] >= year_from && value["year"] <= year_to
    }
    .each { |_, value|
      puts "#{value["title"].ljust(30)} -> #{value["year"]}"
    }
end

print_plays(1560, 1605)

# -----------------------------------------------------------------------------------------------------

if 1 < 2
  puts "É verdade: 1 é menor que 2"
end

puts "É verdade que: 1 é menor que 2? " if 1 < 2

# Em Ruby, tudo é verdadeiro, exceto nil e false

puts "#{'5 <= 10'.ljust(20)} # => #{5 <= 10}"
puts "#{'"abc" == "def"'.ljust(20)} # => #{'abc' == 'def'}"
puts "#{'0'.ljust(20)} # => #{0 == true}"
puts "#{'nil'.ljust(20)} # => #{nil}"
puts "#{'\'xyz\'.empty?'.ljust(20)} # => #{'xyz'.empty?}"
#puts "#{'\'a\' > 5'.ljust(20)} # => #{'a' > 5}"

a = 0

if (a = 100)
  puts "A expressão é verdadeira, mas agora a é: #{a}"
else
  puts "#{a} não é igual a 100"
end

def fome?(hora_do_dia)
  if (hora_do_dia < 12)
    puts "Mim sem fome"
    false
  else
    puts "Mim fome"
    true
  end
end

def comer_um(o_que)
  puts "Mim comer #{o_que}\n"
end

comer_um 'maçã' if fome?(14)
comer_um 'abacate' if fome?(10)

# -----------------------------------------------------------------------------------------------------

class Joke
  attr_accessor :question, :answer, :time, :humor

  # '' is delimiting type of "pergunta"
  def initialize(humor, question="", answer = "")
    @time = Time.now
    @question = question[0..180]
    @humor = humor
    @answer = answer
  end
end

class JokesManager
  def initialize(category)
    @title = category
    @jokes = []
  end

  def create_joke(humor, question, answer)
    @jokes << Joke.new(humor, question, answer)
  end

  def show_stats()
    puts "#{@title} tem #{@jokes.count}"
  end

  def tell_me_all_jokes()
    @jokes.sort_by do |joke|
      joke.time
    end .each do |joke|
      puts "#{joke.question}\n\n - #{joke.answer}"
    end
  end

  def tell_me_a_random_joke()
    joke = @jokes[rand(0...@jokes.length)]
    puts "#{joke&.question}\n\n - #{joke&.answer}"
  end
end

app = JokesManager.new "Piadas Horríveis de 2023"

app.create_joke :pessima, "Por que o pinheiro não se perde na floresta?", "Porque ele tem um mapinha."
app.tell_me_a_random_joke