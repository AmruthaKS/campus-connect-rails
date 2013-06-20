module UserCollegesHelper
  
  def check_access_rights_for?(level_type, user_id, level_id, check_for_access_right)
    if(level_type.eql?(COLLEGE))
      college_priv = UserCollege.where('college_id = ? and user_id = ?', level_id, user_id).select('college_priv').first
      if(!college_priv.nil?)
        return college_priv[:college_priv] >= check_for_access_right
      end
    elsif level_type.eql?(DEPARTMENT)
      dept_priv = UserCollege.where('department_id = ? and user_id = ?', level_id, user_id).select('dept_priv').first
      if(!dept_priv.nil?)
        return dept_priv[:dept_priv] >= check_for_access_right
      end
    elsif level_type.eql?(GROUP)
      group_priv = UserCollege.where('group_id = ? and user_id = ?', level_id, user_id).select('group_priv').first
      if(!group_priv.nil?)
        return group_priv[:group_priv] >= check_for_access_right
      end
    end
  end
  
  def is_admin_for_college?(college_id, user_id)
    check_access_rights_for? COLLEGE, user_id, college_id, ADMIN_ACCESS_RIGHT
  end
  
  def has_write_access_for_college?(college_id, user_id)
    check_access_rights_for? COLLEGE, user_id, college_id, WRITE_ACCESS_RIGHT
  end
  
  def has_read_access_for_college?(college_id, user_id)
    check_access_rights_for? COLLEGE, user_id, college_id, READ_ACCESS_RIGHT
  end
  
  def is_admin_for_dept?(dept_id, user_id)
    check_access_rights_for? DEPARTMENT, user_id, dept_id, ADMIN_ACCESS_RIGHT
  end
  
  def has_write_access_for_dept?(dept_id, user_id)
    check_access_rights_for? DEPARTMENT, user_id, dept_id, WRITE_ACCESS_RIGHT
  end
  
  def has_read_access_for_dept?(dept_id, user_id)
   check_access_rights_for? DEPARTMENT, user_id, dept_id, READ_ACCESS_RIGHT
  end

  
  def is_admin_for_group?(group_id, user_id)
    check_access_rights_for? GROUP, user_id, group_id, ADMIN_ACCESS_RIGHT
  end
  
  def has_write_access_for_group?(group_id, user_id)
    check_access_rights_for? GROUP, user_id, group_id, WRITE_ACCESS_RIGHT
  end
  
  def has_read_access_for_group?(group_id, user_id)
    check_access_rights_for? GROUP, user_id, group_id, READ_ACCESS_RIGHT
  end
  
  def is_dept_and_group_null?(user_id , college_id)
    records = UserCollege.where('user_id = ? and college_id = ? and group_id is null and department_id is null', user_id , college_id)
    puts !records.nil?
    !records.empty?
  end
  
  def is_group_null?(user_id , college_id, department_id)
    records = UserCollege.where('user_id = ? and college_id = ? and department_id = ? and group_id is null', user_id , college_id, department_id)
    puts !records.nil?
    !records.empty?
  end

  def get_admins(id, type)

    if(type.eql?(GROUP))

    elsif type.eql?(DEPARTMENT)

    elsif type.eql?(COLLEGE)

    end
  end

end
