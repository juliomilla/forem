module Forem
  class Vote < ActiveRecord::Base
    belongs_to :poll
    belongs_to :user

    validates :poll_id, uniqueness: { scope: :user_id }
  end
end