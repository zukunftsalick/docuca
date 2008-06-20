class FaqController < ResourceController::Base
  layout 'default'
  def index
   
  end
  
  def show
    @category = FaqCategory.find params[:id]
    @faqs = Faq.find(:all, :conditions => ["faq_category_id = ? ", params[:id]])
    render :layout => false
  end
  
end
