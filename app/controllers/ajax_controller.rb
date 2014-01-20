class AjaxController < ApplicationController
  def users
    if params[:term]
      like= "%".concat(params[:term].concat("%"))
      @user_items = User.where("name like ?", like).limit(10)
    else
      @user_items = User.all
    end
    list = @user_items.map {|u| Hash[ id: u.id, link: user_path(u),label: u.name, image: u.avatar.url(:thumb)]}
    render json: list
  end
end

