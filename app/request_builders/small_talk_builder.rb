class SmallTalkBuilder < RequestBuilder
  class << self
    def valid?(event)
      event.is_a?(TextEvent) && ['greetings', 'goodbye', 'ask-joke'].include?(event.intent)
    end

    def build_request(event)
      SendSmallTalk.new.execute(event)
    end
  end
end
