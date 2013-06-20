require 'spec_helper'

describe "events/edit" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :description => "MyString",
      :event_type => 1,
      :tContent_id => 1,
      :tContent_type => 1
    ))
  end

  it "renders the edit event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => events_path(@event), :method => "post" do
      assert_select "input#event_description", :name => "event[description]"
      assert_select "input#event_event_type", :name => "event[event_type]"
      assert_select "input#event_tContent_id", :name => "event[tContent_id]"
      assert_select "input#event_tContent_type", :name => "event[tContent_type]"
    end
  end
end
