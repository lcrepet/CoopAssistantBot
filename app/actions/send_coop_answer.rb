class SendCoopAnswer < Action
  def initialize(scenario = nil)
    @coop_repo = Coop::Repository.new

    super(scenario)
  end

  def execute(event)
    [text_message(text: @coop_repo.get_answer(code: event.intent.to_sym))]
  end
end
