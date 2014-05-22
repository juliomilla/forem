module Forem
  class FlagsController < Forem::ApplicationController
    def create
      # if params[:post_id]
      flaggable = Post.find(params[:post_id])
      # end
      @flag = Flag.new
      @flag.flaggable = flaggable
      @flag.user = current_user
      if @flag.save
        respond_to do |format|
          format.html { render nothing: true, status: 204, layout: !request.xhr? }
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
            format.json { render nothing: true, status: 204 }
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


