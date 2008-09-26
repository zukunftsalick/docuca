class PagesController < ResourceController::Base
  layout 'study_cases'
  before_filter :login_required, :except => [:index,:show]
  
  belongs_to :study_case
  
  

  index do
    respond_to do |format|
      format.js { render :partial => 'pages'}
      format.html {}
    end
  end
  
  def show
    
    if params[:id]
      @page = Page.find_by_permalink(params[:id])
      @page ||= Page.find(params[:id])
    end
  end
  
  def update
    @page = Page.new params[:page]
    if params[:page][:permalink].empty?
      params[:page][:permalink] = @page.id
    end
    super
  end
  
  def create
    @page = Page.new params[:page]
    if params[:page][:permalink].empty?
      params[:page][:permalink] = @page.id
    end
    super
  end
  
  
end
