class WelcomeController < ApplicationController
  def index
    @postArr = []

    posts = Post.where(public:true)

    posts.each do |post|
        @postArr << post
    end
    p "HERE****************************************************************************************************************************************************************************"
    p @postArr[5].body.embeds.find{|embeds| embeds.image?}
  end

 





  def weather
    #subject = WeatherStation.new("Weather")
    
  end
end
