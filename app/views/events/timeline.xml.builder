xml.instruct! :xml, :version =>"1.0", :encoding =>"UTF-8"
xml.data do
	@events.each do |event|  
		xml.event(event.description,
		'start' => (event.start_date.strftime("%b %d %Y") unless event.start_date.nil? ),
		'end' => (event.end_date.strftime("%b %d %Y") unless event.end_date.nil?), 
		'is_duration' => (event.is_duration) ,
		'title' => (event.title))
	end
end
