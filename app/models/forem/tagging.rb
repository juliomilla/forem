module Forem
  class Tagging < ActiveRecord::Base
    belongs_to :topic
    belongs_to :tag
    # validates_uniqueness_of :topic_id, scope: :tag_id
  end
end