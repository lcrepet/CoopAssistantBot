class Question < ApplicationRecord
  def self.answer_to(code:)
    potential_answsers = Question.where(code: code).pluck(:answser)
    potential_answsers[Random.rand(potential_answsers.count)]
  end
end
