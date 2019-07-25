class HelpBuilder < RequestBuilder
  class << self
    def valid?(_event)
      true
    end

    def build_request(_event)
      SendHelp.new.execute
    end
  end
end
