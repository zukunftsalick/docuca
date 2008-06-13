class Faq < ActiveRecord::Base
  has_many :comments, :as => :commentary
  
  validates_presence_of :question, :answer
  
  # for seo purposes
  def to_param
    "#{id}-#{question.gsub(/[^a-z0-9]+/i, '-')}".downcase
  end
end
