module MicropostsHelper


  def get_referred_object_for_post(micropost)

    if micropost.target_type.eql? USER_MICRO_POST
      User.find(micropost.target_id);

    elsif micropost.target_type.eql? COLLEGE_MICRO_POST
      College.find(micropost.target_id)

    elsif micropost.target_type.eql? DEPARTMENT_MICRO_POST
      Department.find(micropost.target_id)

    elsif micropost.target_type.eql? GROUP_MICRO_POST
      Group.find(micropost.target_id)
      end
  end
end