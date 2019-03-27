class Event
  attr_reader :conversation_id, :raw_message

  def initialize(conversation_id:, raw_message:)
    @conversation_id = conversation_id
    @raw_message = raw_message
  end
end
