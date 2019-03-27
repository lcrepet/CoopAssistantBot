class MessagesController < ApplicationController
  def create
    bot_handle_request(request)
    head :ok
  end

  private

  def bot_handle_request(payload)
    cai_connect.handle_message(payload) do |message|
      event = build_event(message)

      request_builder = request_builders.find { |builder| builder.valid?(event) }
      replies = request_builder.build_request(event)

      cai_connect.send_message(replies, message.conversation_id)
    end
  end

  def request_builders
    [
      HelpBuilder
    ]
  end

  def build_event(message)
    content = message.content
    type = message.type

    if type == 'text'
      cai_analyse = cai_request.analyse_text(content)
      build_event_from_cai(cai_analyse, message)
    else
      build_event_from_raw(message)
    end
  end

  def build_event_from_cai(cai_analyse, message)
    TextEvent.new(
      conversation_id: message.conversation_id,
      raw_message: message,
      intent: cai_analyse.intent&.slug,
      text: cai_analyse.source,
      entities: cai_analyse.entities
    )
  end

  def build_event_from_raw(message)
    TextButton.new(conversation_id: message.conversation_id, raw_message: message, value: message.content)
  end

  def cai_connect
    @cai_connect ||= Sapcai::Connect.new(Rails.application.secrets.cai[:request_token])
  end
  def cai_request
    @cai_request ||= Sapcai::Request.new(Rails.application.secrets.cai[:request_token])
  end
end
