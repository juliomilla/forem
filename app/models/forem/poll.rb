module Forem
  class Poll < ActiveRecord::Base
    belongs_to :topic
    has_many :poll_options, dependent: :destroy
    validates :question, presence: true
  end
end
