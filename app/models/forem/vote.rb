module Forem
  class Vote < ActiveRecord::Base
    belongs_to :poll
    belongs_to :user, class_name: Forem.user_class.to_s

    validates_uniqueness_of :poll_id, scope: :user_id
    # validates :user_id, uniqueness: { scope: :poll_id }
  end
end