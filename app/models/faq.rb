class Faq < ActiveRecord::Base
  has_many :comments, :as => :commentary
  has_many :faq_categories
  
  validates_presence_of :question, :answer
  
  # for seo purposes
  def to_param
    "#{id}-#{question.gsub(/[^a-z0-9]+/i, '-')}".downcase
  end
  
  def faq_category
    FaqCategory.find(self.faq_category_id)
  end
  
  def short_answer
    
  end
end
