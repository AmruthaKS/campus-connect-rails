module UserCollegeHelper
  
  def get_admins_for_college()
    college_admin_ids = "Select user_id form UserCollege where college_priv > 2"
    admins_result = User.where("id in (:college_admin_ids)", college_admin_ids)
  end
  
  def get_priv_for_college(college_id, user_id)
    college_priv = UserCollege.where("college_id = ? and user_id = ?", college_id, user_id).select("college_priv")
    college_pr = college_priv.first
  end
  
  def is_admin_for_college?(college_id, user_id)
    college_pr = get_priv_for_college college_id, user_id
    college_pr[:college_priv] > 2
  end
  
  def has_write_access_for_college?(college_id, user_id)
    college_pr = get_priv_for_college college_id, user_id
    college_pr[:college_priv] > 1
  end
  
  def has_read_access_for_college?(college_id, user_id)
    college_pr = get_priv_for_college college_id, user_id
    college_pr[:college_priv] > 0
  end
  
  def get_priv_for_dept(dept_id, user_id)
    dept_priv = UserCollege.where("department_id = ? and user_id = ?", dept_id, user_id).select("dept_priv")
   dept_priv.first
  end
  
  def is_admin_for_dept?(dept_id, user_id)
    dept_pr = get_priv_for_dept dept_id, user_id
    if(dept_pr.nil?)
      0
    else
    dept_pr[:dept_priv].to_i > 2
    end
  end
  
  def has_write_access_for_dept?(dept_id, user_id)
    dept_pr = get_priv_for_dept dept_id, user_id
    dept_pr[:dept_priv] > 1
  end
  
  def has_read_access_for_dept?(dept_id, user_id)
    dept_pr = get_priv_for_dept dept_id, user_id
    dept_pr[:dept_priv] > 0
  end
  
   def get_priv_for_group(group_id, user_id)
    college_priv = UserCollege.where("group_id = ? and user_id = ?", group_id, user_id).select("group_priv")
    college_pr = college_priv.first
  end
  
   def is_admin_for_group?(group_id, user_id)
    group_pr = get_priv_for_group group_id, user_id
    if(group_pr.nil?)
      0
    else
    group_pr[:group_priv].to_i > 2
    end
  end
  
  def has_write_access_for_group?(group_id, user_id)
    group_pr = get_priv_for_group group_id, user_id
    group_pr[:group_priv] > 1
  end
  
  def has_read_access_for_group?(group_id, user_id)
    group_pr = get_priv_for_group group_id, user_id
    group_pr[:group_priv] > 0
  end
  
  
  def is_dept_and_group_null?(user_id , college_id)
    records = UserCollege.where("user_id = ?, and college_id = ? and group_id is null and department_id is null", user_id , college_id)
    records.nil?
  end
end
