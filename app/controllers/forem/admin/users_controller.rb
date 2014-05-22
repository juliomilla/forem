module Forem
  class Admin::UsersController < ApplicationController
    def autocomplete
      users = Forem.user_class.forem_autocomplete(params[:term])

      users_hash = users.map do |user|
        { :id => user.id, :identifier => user.send(Forem.autocomplete_field)}
      end
      render :json => users_hash
    end
  end
end
