class Vote < ActiveRecord::Base
  belongs_to :voteable, :polymorphic => true
  # Remember to create a migration!
end
