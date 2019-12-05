class DataController < ApplicationController
  #encoding: utf-8
require 'uri'
require 'net/http'
require 'openssl'
require 'open_weather'
#before_action :authenticate_user!
#before_action :authenticate_admin!
def authenticate_admin!
  # check if current user is admin
  unless current_user.admin?
    # if current_user is not admin redirect to some route
    redirect_to '/'
  end
  # if current_user is admin he will proceed to edit action
end

  def index  
  @words = []
  @cleanWords =[]
    # SELECT "action_text_rich_texts".* FROM "action_text_rich_texts" WHERE "action_text_rich_texts"."record_id" = ? AND "action_text_rich_texts"."record_type" = ? AND "action_text_rich_texts"."name" = ? LIMIT ?  [["record_id", 10], ["record_type", "Post"], ["name", "body"], ["LIMIT", 1]]
  sql = "SELECT body from action_text_rich_texts WHERE body IS NOT NULL "
  @result = ActiveRecord::Base.connection.execute(sql)
  #p @result.class = array

  #Kieran_gem.hi(@result)    
 @cleanWords = Kieran_gem.hi(@result)

 p @cleanWords.class

 @hCount = Hash.new
 @cleanWords.each {|w|
 if @hCount.has_key?(w)
   @hCount[w] = @hCount[w]+1
 else
   @hCount[w]=1
 end
 }
 #sort the hash and print the results
 @hCount.sort{|a,b| a[1]<=>b[1]}.each { |elem|
  "\"#{elem[0]}\" has #{elem[1]} occurrences"
  }
  # end of sort
 @hCount.delete('""')

 puts @hCount
    

  end # end of the index 

  def admin
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
  
  end
  
  
end
