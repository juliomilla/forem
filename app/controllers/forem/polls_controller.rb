module Forem
  class PollsController < Forem::ApplicationController
    before_filter :authenticate_forem_user

    def vote
      poll_option = Forem::PollOption.find(params[:poll_option_id])
      poll_option.votes = poll_option.votes + 1
      poll_option.poll.voting_users << forem_user

      if poll_option.save && poll_option.poll.save
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
