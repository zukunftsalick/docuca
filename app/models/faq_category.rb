class FaqCategory < ActiveRecord::Base
  belongs_to :faq
  
  def to_param
    "#{id}-#{name.gsub(/[^a-z0-9]+/i, '-')}".downcase
  end
end
