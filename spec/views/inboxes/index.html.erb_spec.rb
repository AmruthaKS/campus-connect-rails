require 'spec_helper'

describe "inboxes/index" do
  before(:each) do
    assign(:inboxes, [
      stub_model(Inbox,
        :user_id => 1,
        :user_id => 2,
        :notification_id => 3,
        :checked => 4
      ),
      stub_model(Inbox,
        :user_id => 1,
        :user_id => 2,
        :notification_id => 3,
        :checked => 4
      )
    ])
  end

  it "renders a list of inboxes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
