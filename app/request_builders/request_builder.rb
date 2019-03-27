class RequestBuilder
  def valid?(_event)
    raise 'Override me.'
  end

  def buidl_request(_event)
    raise 'Override me'
  end
end
