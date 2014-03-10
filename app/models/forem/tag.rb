module Forem
  class Tag < ActiveRecord::Base
    has_many :topics, through: :taggings
    has_many :taggings
    validates :name, presence: true, unique: true
  end
end