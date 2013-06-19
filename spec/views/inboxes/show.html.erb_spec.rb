require 'spec_helper'

describe "inboxes/show" do
  before(:each) do
    @inbox = assign(:inbox, stub_model(Inbox,
      :user_id => 1,
      :user_id => 2,
      :notification_id => 3,
      :checked => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
  end
end
