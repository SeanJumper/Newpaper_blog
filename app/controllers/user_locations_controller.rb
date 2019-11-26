class UserLocationsController < ApplicationController
#private
require 'uri'
require 'net/http'
require 'openssl'
require 'open_weather'


def index
    result  = Net::HTTP.get(URI.parse("https://samples.openweathermap.org/data/2.5/forecast/daily?id=524901&lang=zh_cn&appid=b6907d289e10d714a6e88b30761fae22"))

    p result

end

def search
    
  url = URI("https://ip-geolocation-ipwhois-io.p.rapidapi.com/json/")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  
  request = Net::HTTP::Get.new(url)
  request["x-rapidapi-host"] = 'ip-geolocation-ipwhois-io.p.rapidapi.com'
  request["x-rapidapi-key"] = '5c444575acmsh3113ee9996424cbp14c28cjsn73363038f5dc'
  
  @response = http.request(request)
  @x = @response.read_body
  @y = JSON.parse(@x) 
  puts @y
  #@y = Kieran_gem.hi(@x)
 # puts @y

 # @UserLoc = @response.read_body
end
private
def request_api(url)
  response = Excon.get(
    url,
    headers: {
      'X-RapidAPI-Host' => URI.parse(url).host,
      'X-RapidAPI-Key' => ENV.fetch('RAPIDAPI_API_KEY')
    }
  )
  return nil if response.status != 200
  JSON.parse(response.body)
end
def find_ip(ip)

     response  = Net::HTTP.get(URI.parse("https://ip-geolocation-ipwhois-io.p.rapidapi.com/json/ip"))

     response = http.request(request)
     puts response.read_body

  #request_api(
   # "https://ip-geolocation-ipwhois-io.p.rapidapi.com/json/ip"
  #)
  

end
end
#def

#private
#def request_api(url)
 ##  url,
   # headers: {
    #  'ip-geolocation-ipwhois-io.p.rapidapi.com/' => URI.parse(url).host,
     # '5c444575acmsh3113ee9996424cbp14c28cjsn73363038f5dc' => ENV.fetch('RAPIDAPI_API_KEY')
    #}
  #)
  #return nil if response.status != 200
  #JSON.parse(response.body)
#end

#def pull_api
 #   request_api("https://ip-geolocation-ipwhois-io.p.rapidapi.com/json/ip")
    #JSON.parse(response.body)
#end
#end
