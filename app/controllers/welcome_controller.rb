class WelcomeController < ApplicationController
  def index
  
  end
  def weather
    WeatherStation.new("Weather")
  end
end
