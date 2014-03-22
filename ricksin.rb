require 'sinatra'
require 'redis'

get("/") do
  derp = "#{params[:link].hash.to_s.slice(-6..-1)}"
  @astlied = derp
  @notastlied = "#{params[:link]}"
  Redis.new.set @astlied, @notastlied
  erb(:home)
end

get("/l") do
  @l = Redis.new.get params[:l]
  erb(:link)
end

get('/test') do
  erb(:test)
end
