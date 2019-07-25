class SendSmallTalk < Action
  def initialize(scenario = nil)
    @cai_build = Sapcai::Build.new(Rails.application.secrets.cai[:request_token])

    super(scenario)
  end

  def execute(event)
    cai_response = @cai_build.dialog(event.raw_message, event.conversation_id)

    cai_response.messages.map do |message|
      { type: message.type, content: message.content }
    end
  end
end
