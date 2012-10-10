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
      redirect_to root_url
    end
  end
  
  def destroy
    @comment.destroy
    redirect_to root_url
  end

  private
   def correct_user
      @comment = current_user.comments.find_by_id(params[:id])
      redirect_to root_url if @comment.nil?
    end
end