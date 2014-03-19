module Forem
  class NilUser
    def email
      "nobody@example.com"
    end

    def to_s
      "Användaren borttagen"
    end

    def name
      "Användaren borttagen"
    end
    def marked_for_destruction?
      false
    end
  end
end