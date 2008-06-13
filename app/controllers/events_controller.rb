class EventsController < ResourceController::Base
  belongs_to :study_case

  before_filter :login_required
  layout 'default'
  
  
  def timeline
    @events = StudyCase.find(params[:id]).events
    #@events  = Event.find(:all)
    respond_to do |wants|
      wants.xml { 
        render :layout => false
      }  
    end
  end
end
