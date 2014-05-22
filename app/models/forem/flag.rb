module Forem
  class Flag < ActiveRecord::Base
    belongs_to :user, :class_name => Forem.user_class.to_s
    belongs_to :flaggable, polymorphic: true, counter_cache: true
    
    validates :user, presence: true
    validates :flaggable, presence: true
  end
end