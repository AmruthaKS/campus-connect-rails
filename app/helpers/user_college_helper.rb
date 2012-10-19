module UserCollegeHelper
  
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
    dept_pr = dept_priv.first
  end
  
  def is_admin_for_dept?(dept_id, user_id)
    dept_pr = get_priv_for_dept dept_id, user_id
    dept_pr[:dept_priv] > 2
  end
  
  def has_write_access_for_dept?(dept_id, user_id)
    dept_pr = get_priv_for_dept dept_id, user_id
    dept_pr[:dept_priv] > 1
  end
  
  def has_read_access_for_dept?(dept_id, user_id)
    dept_pr = get_priv_for_dept dept_id, user_id
    dept_pr[:dept_priv] > 0
  end
  
end
