module EventsHelper
  def get_tcontent_string_for_event(event)
    if event.tContent_type.eql? USER_TCONTENT_TYPE

    elsif event.tContent_type.eql? COLLEGE_TCONTENT_TYPE
      @college = College.find(event.tContent_id)
      @college.name
    end
  end

  def get_tcontent_object_for_event(event)
    if event.tContent_type.eql? USER_TCONTENT_TYPE

    elsif event.tContent_type.eql? COLLEGE_TCONTENT_TYPE
      @college = College.find(event.tContent_id)
    end
  end
end
