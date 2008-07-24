class Page < ActiveRecord::Base
  belongs_to :study_case
  validates_presence_of :title, :message => "não pode ser em branco."
  validates_presence_of :content, :message => "não pode ser em branco."
  validates_uniqueness_of :permalink, :message => "deve ser único."
end
