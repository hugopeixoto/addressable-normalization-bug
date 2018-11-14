require 'addressable'

require_relative "./patch.rb"

puts Addressable::URI.parse("https://x.com/users?email=hugo%40frctls.com")
puts Addressable::URI.parse("https://x.com/users?email=hugo%40frctls.com").normalize
