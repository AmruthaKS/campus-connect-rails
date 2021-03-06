class CommentsController < ApplicationController
  before_filter :correct_user,   :only => :destroy
  def index
  end

  def create
    comment_params = params[:comment]
    @micropost = Micropost.find_by_id(comment_params[:micropost_id])

    @comment = @micropost.comments.build
    @comment.content = comment_params[:content]
    logged_in_user = current_user.id
    @comment.user_id = logged_in_user
    micro_post_id = @micropost.id
    @micro_posst_id_for_response = micro_post_id

    if @comment.save
      #todo move code to the helper if possible
      #create a event
      event = current_user.events.build
      event.user_id = logged_in_user
      event.event_type = COMMENT_EVENT_TYPE
      event.tContent_id = micro_post_id
      event.tContent_type = POST_TCONTENT_TYPE

      event.description = current_user.name + ' ' + EVENT_TYPES[COMMENT_EVENT_TYPE] + ' post'
      event.save

      micro_post_user_id = @micropost.user.id
      if micro_post_user_id != logged_in_user
        #create a notification
        notification = Notification.new
        notification.event_id = event.id
        #todo: analyze the description part does this really makes sense?
        notification.description = '<b>' + current_user.name + '</b> ' + EVENT_TYPES[COMMENT_EVENT_TYPE] + ' your <b>post</b>'
        notification.notification_type = COMMENT_NOTIFICATION_TYPE

        #Here it is important because to generate the clickable notification link
        notification.tContent_id = micro_post_id
        notification.tContent_type= POST_RCONTENT_TYPE
        notification.save

        #add to the user inbox
        inbox = Inbox.new
        inbox.notification_id = notification.id
        inbox.user_id = micro_post_user_id
        inbox.checked = false
        inbox.save
      end

      respond_to do |format|
        format.html {
          redirect_to root_url
        }
        format.js
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
        format.html {
          redirect_to root_url
        }
        format.js
      end
  end

  private

  def correct_user
    @comment_by_loggedin_user = !current_user.comments.find_by_id(params[:id]).nil?
    @commment_on_loggedin_user = current_user?(Comment.find(params[:id]).micropost.user)
    if @comment_by_loggedin_user || @commment_on_loggedin_user
    else
      redirect_to root_url
    end
  end

end