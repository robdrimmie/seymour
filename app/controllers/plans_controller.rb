class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def new
    @meals =  Meal.all
    @plan = Plan.new
  end

end
