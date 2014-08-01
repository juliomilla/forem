module Forem
  class PollsController < Forem::ApplicationController
    # before_filter :authenticate_forem_user

    def vote
      if (forem_user.is_a? NilClass) || !forem_user
        respond_to do |format|
          format.js { render nothing: true, status: 401 }
          format.html { render nothing: true, status: 401 }
        end
      end

      poll_option = Forem::PollOption.find(params[:poll_option_id])
      poll_option.votes = poll_option.votes + 1
      poll_option.poll.voting_users << forem_user

      begin
        saved = poll_option.save
      rescue
        saved = false
      end

      if saved
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
