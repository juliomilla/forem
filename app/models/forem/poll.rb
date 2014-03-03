module Forem
  class Poll < ActiveRecord::Base
    belongs_to :topic, foreign_key: :forem_topic_id
    has_many :poll_options, dependent: :destroy
    validates :question, presence: true
    accepts_nested_attributes_for :poll_options

    has_and_belongs_to_many :voting_users, class_name: Forem.user_class.to_s
    
    def vote poll_option_id, user
      opt = self.poll_options.find(poll_option_id)
      opt.votes = opt.votes + 1
      self.voting_users << user
    end
  end
end
