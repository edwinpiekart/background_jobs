class BatchCitiesWorkerCreator

  def initialize(cities_str)
    @cities_arr = cities_str.split(';')
  end

  def create!
    @cities_arr.each do |city|
      weather_query = WeatherQuery.new
      weather_query.params_hash = weather_query.params_hash.merge({q: city})

      StdWorkerCreator.new(weather_query).create!
    end
  end

end
