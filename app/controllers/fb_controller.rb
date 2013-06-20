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
    @user.password = "password123"
    if @user.save
      sign_in @user
      flash.now[:success] = "Welcome to the Comapus Connect!!"
      redirect_to @user
    else
      render 'users/new'
    end

  end

  private
  def setup_client
    @client = FBGraph::Client.new(:client_id => '197706077036694',:secret_id =>'821d276c9d7ab11d7c04534e600b64fc')
  end

end
