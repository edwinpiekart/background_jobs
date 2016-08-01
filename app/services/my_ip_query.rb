class MyIpQuery < Query

  def uri_str
    'https://api.ipify.org?format=json'
  end

  def params_hash
    {}
  end

end
