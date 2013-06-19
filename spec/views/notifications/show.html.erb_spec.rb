require 'spec_helper'

describe "notifications/show" do
  before(:each) do
    @notification = assign(:notification, stub_model(Notification,
      :description => "Description",
      :notification_type => 1,
      :tContent_id => 2,
      :tContent_type => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
