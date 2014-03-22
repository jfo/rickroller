require 'socket'
require 'open-uri'
server = TCPServer.open(3000)

puts "Listening on local 3000"

loop do
  client = server.accept
  # firsturl = client.gets
  # thing = firsturl.match(/\?.+$/).to_s[1..-1]
  # page = open(firsturl.match(/\?.+$/).to_s[1..-1])
  # contents = page.read
  # client.puts(contents)
  # derp = firsturl.match(/\?.+ /).to_s
  client.puts("hello from the server")
  client.close
end
