class CommentsController < ResourceController::Base
  belongs_to :study_case, :faq
  #before_filter :login_required, :only => [:delete]
  layout 'default'
  
  
  index do
   
    respond_to do |wants|
      wants.js{ render :layout => false}
    end
  end
  
  create do
    wants.html {redirect_to :back}
  end
  
end
