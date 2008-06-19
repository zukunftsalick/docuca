class FaqController < ResourceController::Base
  layout 'default'
  def index
   
  end
  
  def show
    @category = FaqCategory.find params[:id]
    @faqs = Faq.find_by_faq_category_id(params[:id]).to_a
  end
  
end
