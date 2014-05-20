module Forem
  class ForumsController < Forem::ApplicationController
    load_and_authorize_resource :class => 'Forem::Forum', :only => :show
    helper 'forem/topics'
    def fresh_topics
      limit = params[:limit]
      offset = params[:offset]
      limit ||= 10
      offset ||= 0
      @topics = Forem::Topic.with_last_post.with_poll.order('last_post_at DESC').limit(limit).offset(offset)
      render 'forem/forums/topics_list', layout: !request.xhr?
    end
    def index
      @fresh_topics = Forem::Topic.with_last_post.with_poll.order('last_post_at DESC').limit(5)
      @categories = Forem::Category.with_forums_topics_posts.all
    end
    def show
      authorize! :show, @forum
      register_view
      @topics = if forem_admin_or_moderator?(@forum)
        @forum.topics
      else
        @forum.topics.visible.approved_or_pending_review_for(forem_user)
      end
      @topics = @topics.with_user.with_last_post
      @topics = @topics.by_pinned_or_most_recent_post
      # Kaminari allows to configure the method and param used
      @topics = @topics.send(pagination_method, params[pagination_param]).per(Forem.per_page)
      respond_to do |format|
        format.html
        format.atom { render :layout => false }
      end
    end
    private
    def register_view
      @forum.register_view_by(forem_user)
    end
  end
end
