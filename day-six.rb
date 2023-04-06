require_relative 'helpers'

Helpers.puts_title "Constants"

class RubyConstants
  AUTHOR = "Henrique Melo".freeze
  ABOUT  = <<ABOUT_HIM
He is a Brazilian software engineer focused on backend applications
with lots of hard skills
ABOUT_HIM
    .freeze

end

puts RubyConstants::AUTHOR
puts RubyConstants::ABOUT

# ######################################################################################################################

Helpers.puts_title "Simplified Regex"

puts "String has vowels" if "This is a test"=~/[aeiou]/
puts "String contains no digits" unless "This a test" =~/[0-9]/

# ######################################################################################################################

Helpers.puts_title "MatchData Object"

URL = 'https://docs.ruby-lang.org/en/2.5.0/MatchData.html'.freeze

result = URL.match /(\d\.?)+/
puts result[0]
puts Regexp.last_match
puts result[1]
puts result&.captures
puts

result = URL.match(%r{([^/]+)/([^/]+)\.html$})
puts result[1]
puts result&.captures
print result&.values_at(1,2)
puts "\n\n"

result = URL.match(%r{(?<version>[^/]+)/(?<module>[^/]+)\.html$})
print "#{result&.captures} \n"
puts result&.named_captures
puts result[:version]
puts result&.values_at :version, :module
puts

puts "Last Match: #{$~}"
puts "Last Match[0]: #{$&}"
puts "Last Match - Pre Match: #{$`}"
puts "Last Match - Post Match: #{$'}"
puts "Last Match - Last Capture: #{$+}"