class Meal < ActiveRecord::Base

  has_many :plans, :dependent => :destroy

end
