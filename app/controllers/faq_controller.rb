class FaqController < ResourceController::Base
  layout 'faq'
  
  
  def index
   
  end
  
  def show
    @category = FaqCategory.find params[:id]
    @faqs = Faq.find(:all, :conditions => ["faq_category_id = ? ", params[:id]])
    respond_to do |wants|
      wants.html 
      wants.js {
          render :layout => false
        }
    end
  end
  
end
