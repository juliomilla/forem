module Forem
  class PollsController < Forem::ApplicationController
    before_filter :authenticate_forem_user

    def vote
      poll_option = PollOption.find(params[:poll_option_id])
      poll_option.votes = poll_option.votes + 1
      poll_option.users << forem_user

      if poll_option.save
        respond_to do |format|
          format.js { render nothing: true, status: 204}
          format.html { render nothing: true, status: 204}
        end
      else
        respond_to do |format|
          format.js { render nothing: true, status: 400 }
          format.html { render nothing: true, status: 400 }
        end
      end
    end
  end
end
