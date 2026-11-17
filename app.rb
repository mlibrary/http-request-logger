require "sinatra"

get "/" do
  puts request.inspect
  "GET request received"
end

post "/" do
  puts request.inspect
  "POST request received"
end
