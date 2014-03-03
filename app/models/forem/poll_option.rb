module Forem
  class PollOption < ActiveRecord::Base
    belongs_to :poll, foreign_key: :forem_poll_id
    validates :description, presence: true
    has_and_belongs_to_many :voting_users, class_name: Forem.user_class.to_s

    def votes_percentage_of_total
      tot = self.poll.poll_options.pluck(:votes).inject(0) {|acc, elem| acc + elem}
      if !tot.nil? && !self.votes.nil? && self.votes > 0 && tot > 0
        return ((self.votes.to_f / tot.to_f) * 100).round(0).to_i
      else
        return 0
      end
    end
  end
end
