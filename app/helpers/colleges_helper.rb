module CollegesHelper
  def college_image(college, size)
    image_tag("/assets/colleges/"+college.id.to_s + ".jpg", :alt => college.name, :class => "gravatar", :size => size.to_s + "x" +size.to_s)
  end
end
