module Forem
  class Poll < ActiveRecord::Base
    belongs_to :topic
    has_many :poll_options, dependent: :destroy
    validates :question, presence: true
    # accepts_nested_attributes_for :poll_options
  end
end
