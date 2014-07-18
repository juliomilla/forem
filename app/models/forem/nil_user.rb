module Forem
  class NilUser
    def email
      "Användaren borttagen"
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
  
  def marked_for_destruction?
    false
  end
end
