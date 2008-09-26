class StudyCasesController < ResourceController::Base
  #before_filter :admin_required, :except => [:index, :show]
  before_filter :login_required, :except => [:index,:show]
  
  layout 'study_cases'
  
  def index
    @study_cases = StudyCase.paginate :page => params[:page], :order => 'created_at DESC'
    
    respond_to do |format|
      format.js{  render :partial => "study_cases"  }
      format.html{  }
    end
    
  end
  
  
  protected
  
  # avoid unauthorized access 
  def is_admin?(id=nil)
    id ||= params[:id]
    current_user.id == StudyCase.find(id).user.id
  end
  
  def admin_denied
    respond_to do |format|
      format.html do
        store_location
        flash[:notice] = 'Você deve ser o autor para poder editar.'
        redirect_to study_cases_path
      end
    end
  end
  
  
  def pages
    Page.find(:all)
    respond_to do |format|
      format.js{
        render :text => "<option>bla</option>"
      }
    end
  end
  
end
