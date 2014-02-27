module Forem
  class PollOption < ActiveRecord::Base
    belongs_to :poll
    validates :description, presence: true
    has_and_belongs_to_many :voting_users, class_name: Forem.user_class.to_s
  end
end
