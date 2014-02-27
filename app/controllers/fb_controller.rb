class FbController < ApplicationController
  require "fbgraph"
  before_filter :setup_client
  def login
    redirect_to @client.authorization.authorize_url(:redirect_uri => fb_redirect_url , :scope => 'email')
  end

  def redirect
    access_token = @client.authorization.process_callback(params[:code], :redirect_uri => fb_redirect_url)
    user_info = @client.selection.me.info!

    @user = User.new

    @user.name = user_info.name
    @user.email = user_info.email
    #@user.password = "password123"
      render 'users/new'
  end

  private
  def setup_client
    @client = FBGraph::Client.new(:client_id => '632863720094476',:secret_id =>'b2eb57002b6d3a5d367b81a87a189a31')
  end

end
