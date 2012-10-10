require 'spec_helper'

describe "User Pages" do
  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h1',    :text => user.name) }
  it { should have_selector('title', :text => user.name) }

    #prints(full_title('Sign up'))
  end
end
