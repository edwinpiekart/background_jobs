class Query
  attr_writer :retries, :exceptions

  def uri_str
    raise NotImplementedError
  end

  def params_hash
    raise NotImplementedError
  end

  def retries
    @retries || 0
  end

  def exceptions
    @exceptions || ''
  end

end
