class ScheduleBuilder < RequestBuilder
  extend WithAuthenticatedUser

  class << self
    def valid?(event)
      event.is_a?(TextEvent) && event.intent == 'ask_schedule'
    end

    def build_request(event)
      after_user_authenticated(event) do |user|
        SendSchedule.new.execute(event, user)
      end
    end
  end
end
