class Scenario < ApplicationRecord
  include AASM

  GREETINGS_INTENT = 'greetings'
  GOODBYE_INTENT = 'goodbye'
  THANKS_INTENT = 'say-thanks'

  belongs_to :conversation

  validates :conversation, presence: true

  before_create :setup_parameters

  def done?
    true
  end

  def make_sense_of(_event)
    raise StandardError.new('Override me.')
  end

  def update_next_step
    raise StandardError.new('Override me.')
  end

  def force_terminate
    update(aasm_state: :done)
  end

  def action
    raise StandardError.new('Override me.')
  end

  def reset_parameters
    update(parameters: {})
  end

  def update_parameters(params)
    return if params.blank?
    update(parameters: parameters.merge(params))
  end

  protected

  def setup_parameters
    self.parameters = {} unless self.parameters
  end
end
