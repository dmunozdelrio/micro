require "http/server"

port = (ENV["PORT"]? || "3016").to_i
server = HTTP::Server.new do |context|
  context.response.content_type = "text/plain"
  context.response.print "Crystal IoT Service"
end

puts "Crystal IoT Service running on port #{port}"
server.listen port
