class WeatherAmsterdamQuery < WeatherQuery

  def params_hash
    super.merge({q: 'Amsterdam,nl'})
  end

end
