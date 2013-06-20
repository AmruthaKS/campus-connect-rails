require 'spec_helper'

describe "notifications/new" do
  before(:each) do
    assign(:notification, stub_model(Notification,
      :description => "MyString",
      :notification_type => 1,
      :tContent_id => 1,
      :tContent_type => 1
    ).as_new_record)
  end

  it "renders new notification form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => notifications_path, :method => "post" do
      assert_select "input#notification_description", :name => "notification[description]"
      assert_select "input#notification_notification_type", :name => "notification[notification_type]"
      assert_select "input#notification_tContent_id", :name => "notification[tContent_id]"
      assert_select "input#notification_tContent_type", :name => "notification[tContent_type]"
    end
  end
end
