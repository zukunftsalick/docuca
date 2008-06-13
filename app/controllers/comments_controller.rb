class CommentsController < ResourceController::Base
  
  before_filter :login_required
  layout 'default'
  
  belongs_to :study_case, :faq
end
