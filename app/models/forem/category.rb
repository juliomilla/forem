require 'friendly_id'

module Forem
  class Category < ActiveRecord::Base
    extend FriendlyId
    friendly_id :name, :use => [:slugged, :finders]

    has_many :forums
    validates :name, :presence => true

    scope :with_forums_topics_posts, -> { includes forums: { topics: {}, last_post: { user: {} } } }

    def to_s
      name
    end

  end
end
