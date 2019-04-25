class User < ApplicationRecord
  validates :messenger_id, uniqueness: true
end
