module Forem
  class Vote < ActiveRecord::Base
    belongs_to :poll
    belongs_to :user, class_name: Forem.user_class.to_s

    validates :poll_id, uniqueness: { scope: :user_id }
  end
end