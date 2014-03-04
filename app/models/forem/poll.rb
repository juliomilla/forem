module Forem
  class Poll < ActiveRecord::Base

    belongs_to :topic
    has_many :poll_options, dependent: :destroy
    validates :question, presence: true
    accepts_nested_attributes_for :poll_options

    has_many :votes
    
    has_many :voting_users, through: :votes, class_name: Forem.user_class.to_s, source: :user
    
    def total_votes
      self.poll_options.pluck(:votes).inject(0) {|acc, elem| acc + elem}
    end

    # def vote poll_option_id, user
    #   opt = self.poll_options.find(poll_option_id)
    #   opt.votes = opt.votes + 1
    #   self.voting_users << user
    # end
  end
end
