class TextEvent < Event
  attr_reader :text, :intent, :entities

  def initialize(conversation_id:, raw_message:, text:, intent:, entities:)
    @text = text
    @intent = intent
    @entities = entities
    super(conversation_id: conversation_id, raw_message: raw_message)
  end
end
