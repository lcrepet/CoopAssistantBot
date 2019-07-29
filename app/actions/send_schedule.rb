class SendSchedule < Action
  MONTHS = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'September',
    'October',
    'November',
    'December'
  ].freeze

  def initialize(scenario = nil)
    @coop_repo = Coop::Repository.new

    super(scenario)
  end

  def execute(event, user)
    scheduled_months = @coop_repo.scheduled_months_for(user: user.coop_token)
    scheduled_months_string = scheduled_months.map { |month_number| MONTHS[month_number] }.join(', ')

    [text_message(text: "You scheduled shifts for the following months: #{scheduled_months_string}.")]
  end
end
