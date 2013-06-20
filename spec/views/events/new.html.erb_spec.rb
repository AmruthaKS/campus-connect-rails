require 'spec_helper'

describe "events/new" do
  before(:each) do
    assign(:event, stub_model(Event,
      :description => "MyString",
      :event_type => 1,
      :tContent_id => 1,
      :tContent_type => 1
    ).as_new_record)
  end

  it "renders new event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => events_path, :method => "post" do
      assert_select "input#event_description", :name => "event[description]"
      assert_select "input#event_event_type", :name => "event[event_type]"
      assert_select "input#event_tContent_id", :name => "event[tContent_id]"
      assert_select "input#event_tContent_type", :name => "event[tContent_type]"
    end
  end
end
