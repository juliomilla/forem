require 'friendly_id'

module Forem
  class Category < ActiveRecord::Base
    extend FriendlyId
    friendly_id :name, :use => [:slugged, :finders]

    has_many :forums
    validates :name, :presence => true

    scope :with_forums_topics_posts, -> {includes forums: {last_post: {user: {}, topic: {}}, moderators: {}}}

    def to_s
      name
    end

  end
end
