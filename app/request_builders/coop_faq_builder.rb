class CoopFaqBuilder < RequestBuilder
  class << self
    def valid?(event)
      event.is_a?(TextEvent) && ['shift', 'location', 'opening'].include?(event.intent)
    end

    def build_request(event)
      SendCoopAnswer.new.execute(event)
    end
  end
end
