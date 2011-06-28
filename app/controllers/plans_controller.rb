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
    @dayOfPlan = DateTime.civil_from_format( :local,
                                 params[:plan]["day(1i)"].to_i,
                                 params[:plan]["day(2i)"].to_i,
                                 params[:plan]["day(3i)"].to_i,
                                 0, 0, 0 )
    logger.debug( @dayOfPlan )
    logger.debug( "ROB WAS THERE" )
    @plan = @meal.plans.create(:day => @dayOfPlan)

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
