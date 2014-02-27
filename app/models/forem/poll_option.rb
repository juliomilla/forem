module Forem
  class PollOption < ActiveRecord::Base
    belongs_to :poll
    validates :description, presence: true
  end
end
