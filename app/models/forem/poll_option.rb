module Forem
  class PollOption < ActiveRecord::Base
    
    belongs_to :poll
    validates :description, presence: true


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
