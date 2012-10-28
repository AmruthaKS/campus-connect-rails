class UserCollegeController < ApplicationController
  def college=(collge_name)
    self.college = College.find_by_name(collge_name) unless college_name.blank?
  end
end
