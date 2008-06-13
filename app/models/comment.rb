class Comment < ActiveRecord::Base
  belongs_to :commentary, :polymorphic => true
end
