class Conversation < ApplicationRecord
  has_many :scenarios, inverse_of: :conversation, dependent: :destroy

  validates :recast_conversation_id, presence: true, uniqueness: true
  validates :participant_id, presence: true

  def current_scenario
    scenarios.order(created_at: :desc).reject(&:done?).first
  end

  def start_or_find_current_scenario
    current_scenario || DefaultScenario.create(conversation: self)
  end

  def terminate_all_scenarios
    scenarios.reject(&:done?).each { |scenario| scenario.force_terminate }
  end

  def reset
    update(consecutive_incomprehensions_number: 0)
    terminate_all_scenarios
  end

  def update_last_message_received_at
    update(last_message_received_at: Time.current)
  end
end
