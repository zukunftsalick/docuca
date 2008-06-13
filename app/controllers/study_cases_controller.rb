class StudyCasesController < ResourceController::Base
  before_filter :login_required
  layout 'default'
  
  def index
    @study_cases = StudyCase.paginate :page => params[:page], :order => 'created_at DESC'
  end
end
