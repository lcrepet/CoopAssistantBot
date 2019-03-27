class ButtonEvent < Event
  attr_reader :value

  def initialize(conversation_id:, raw_message:, value:)
    @value = value
    super(conversation_id: conversation_id, raw_message: raw_message)
  end
end
