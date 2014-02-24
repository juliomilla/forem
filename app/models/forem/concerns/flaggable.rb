module Forem
  module Concerns
    module Flaggable
      def self.included(base)
        base.class_eval do
          has_many :flags, as: :flaggable, class_name: 'Flag'
          has_many :flaggers, through: :flagged_this, class_name: 'User'
        end
      end
    end
  end
end