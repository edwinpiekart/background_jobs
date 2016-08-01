class WeatherLondonQuery < WeatherQuery

  def params_hash
    super.merge({q: 'London,gb'})
  end

end
