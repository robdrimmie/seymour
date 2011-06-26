class PlansController < ApplicationController
  def index
    @plans = Plan.all
  end

  def new
    @meals =  Meal.all
    @plan = Plan.new
  end

  def create
    @meal = Meal.find(params[:plan][:meal])
    @plan = @meal.plans.build(params[:plan]["day"] )

    respond_to do |format|
      if @plan.save
        format.html { redirect_to(@plan, :notice => 'Plan was successfully created.') }  
        format.xml  { render :xml => @plan, :status => :created, :location => @plan }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @plan = Plan.find(params[:id])
  end

end
