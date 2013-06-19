require 'spec_helper'

describe "inboxes/edit" do
  before(:each) do
    @inbox = assign(:inbox, stub_model(Inbox,
      :user_id => 1,
      :user_id => 1,
      :notification_id => 1,
      :checked => 1
    ))
  end

  it "renders the edit inbox form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => inboxes_path(@inbox), :method => "post" do
      assert_select "input#inbox_user_id", :name => "inbox[user_id]"
      assert_select "input#inbox_user_id", :name => "inbox[user_id]"
      assert_select "input#inbox_notification_id", :name => "inbox[notification_id]"
      assert_select "input#inbox_checked", :name => "inbox[checked]"
    end
  end
end
