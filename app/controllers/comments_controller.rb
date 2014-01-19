class CommentsController < ApplicationController
  before_filter :correct_user,   :only => :destroy
  def index
  end

  def create
    comment_params = params[:comment]
    @micropost = Micropost.find_by_id(comment_params[:micropost_id])
    @comment = @micropost.comments.build
    @comment.content = comment_params[:content]
    @comment.user_id = current_user.id

    if @comment.save
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