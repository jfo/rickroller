require 'sinatra'
require 'redis'
require 'net/http'
require 'open-uri'

get("/") do
  derp = "#{params[:l].hash.to_s.slice(-6..-1)}"
  @astlied = derp
  @notastlied = "#{params[:l]}"

  Redis.new.set @astlied, @notastlied
  erb(:home)
end

get("/l") do
  @l = Redis.new.get params[:l]
  erb(:link)
end

get("/check") do

  if params[:link]

    thing = open(params[:link]) { |w| w.meta["x-frame-options"] }

    if ["SAMEORIGIN", "DENY"].include? thing
      "KITTEN DENIED"
    else
      "MEOW MEOW YAAAAAY"
    end
  else
    "no uri specified"
  end


end
