module Forem
  class PollOption < ActiveRecord::Base
    belongs_to :poll, foreign_key: :forem_poll_id
    validates :description, presence: true
    has_and_belongs_to_many :voting_users, class_name: Forem.user_class.to_s
  end
end
