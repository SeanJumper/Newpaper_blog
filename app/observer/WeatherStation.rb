require 'observer'
require 'open_weather'
require 'net/http'

class WeatherStation          
  include Observable

  def initialize(symbol)
    @symbol = symbol
  end

  def run
    last_price = nil
    loop do
      price = Price.fetch(@symbol)
      print "Current price: #{price}\n"
      if price != last_price
        changed                 # notify observers
        last_price = price
        notify_observers(Time.now, price)
      end
      sleep 10
    end
  end
end

class Price           
  def self.fetch(symbol)
     Net::HTTP.get(URI.parse('https://samples.openweathermap.org/data/2.5/forecast?id=524901&appid=b1b15e88fa797225412429c1c50c122a1'))  

  end
end

class Warner          ### An abstract observer of WeatherStation objects.
  def initialize(weatherStation) 
    weatherStation.add_observer(self)
  end
end



weatherStation = WeatherStation.new("MSFT")
weatherStation.run