module UsersHelper
  def gravatar_for(user, size)
  #  gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
   # gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag("/assets/users/"+user.id.to_s + ".jpg", :alt => user.name, :class => "gravatar", :size => size.to_s + "x" +size.to_s)
  end
end
