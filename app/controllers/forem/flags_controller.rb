module Forem
  class FlagsController < Forem::ApplicationController
    def create
      flaggable = params[:flaggable_type].classify.constantize.find(params[:flaggable_id])

      @flag = Flag.new
      @flag.flaggable = flaggable
      @flag.user = current_user

      if @flag.save
        @flaggable_parent = params[:flaggable_parent].classify.constantize.find(params[:flaggable_parent_id])

        respond_to do |format|
          format.html { render 'show', status: 200, layout: !request.xhr? }
          format.json { render json: @flag, status: 200 }
        end
      else
        respond_to do |format|
          format.html { render nothing: true, status: 401 }
          format.json { render json: @flag.errors, status: 401 }
        end
      end
    end
    def destroy
      @flag = Flag.find(params[:id])
      if @flag.user == current_user
        if @flag.destroy
          respond_to do |format|
            format.html { render nothing: true, status: 204 }
            format.json { render nothing: true, status: 204}
          end
        else
          respond_to do |format|
            format.html { render nothing: true, status: 401 }
            format.json { render nothing: true, status: 401 }
          end
        end
      end
    end
  end
end


