module Forem
  class Admin::UsersController < ApplicationController
    def autocomplete
      users = Forem.user_class.forem_autocomplete(params[:term])
      users = users.map do |u|
        identifier = u.send(Forem.autocomplete_field)

        if identifier.empty? || identifier.nil?
          identifier = u.email
        end
        if identifier.empty? || identifier.nil?
          identifier = u.full_name
        end
        { :id => u.id, :identifier => identifier }
      end
      render :json => users
    end
  end
end
