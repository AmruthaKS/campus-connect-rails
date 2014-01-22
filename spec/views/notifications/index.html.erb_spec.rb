require 'spec_helper'

describe "notifications/index" do
  before(:each) do
    assign(:inbox_items, [
      stub_model(Notification,
        :description => "Description",
        :notification_type => 1,
        :tContent_id => 2,
        :tContent_type => 3
      ),
      stub_model(Notification,
        :description => "Description",
        :notification_type => 1,
        :tContent_id => 2,
        :tContent_type => 3
      )
    ])
  end

  it "renders a list of notifications" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
