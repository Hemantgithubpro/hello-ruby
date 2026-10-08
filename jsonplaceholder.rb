require 'net/http'
require 'json'

uri = URI('https://jsonplaceholder.typicode.com/posts?_limit=5')
response = Net::HTTP.get_response(uri)

if response.is_a?(Net::HTTPSuccess)
  posts = JSON.parse(response.body)
  posts.each do |post|
    puts "#{post['id']}: #{post['title']}"
  end
else
  puts "Error: #{response.code} #{response.message}"
end
