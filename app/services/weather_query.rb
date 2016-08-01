class WeatherQuery < Query
  attr_writer :params_hash

  def uri_str
    'http://api.openweathermap.org/data/2.5/weather'
  end

  def params_hash
    @params_hash || {q: 'Warsaw,pl', appid: '3f91ad722646e6d57a84ddda3eb56f30'}
  end

end
