require 'test_helper'

class QueryTest < ActiveSupport::TestCase

  def setup
    @query = Query.new
  end

  test '#uri_str' do
    assert_raises(NotImplementedError) do
      @query.uri_str
    end
  end

  test '#params_hash' do
    assert_raises(NotImplementedError) do
      @query.params_hash
    end
  end

  test '#retries' do
    assert_equal(0, @query.retries)
  end

  test '#retries with param' do
    #given
    retries = 3
    #when
    @query.retries = retries
    #then
    assert_equal(retries, @query.retries)
  end

  test '#exceptions' do
    assert_equal('', @query.exceptions)
  end

  test '#exceptions with param' do
    #given
    exceptions = 'NoMethodError'
    #when
    @query.exceptions = exceptions
    #then
    assert_equal(exceptions, @query.exceptions)
  end

end
