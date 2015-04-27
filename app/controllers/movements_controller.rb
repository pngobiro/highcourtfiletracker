class MovementsController < ApplicationController
before_filter :authenticate_user!

# GET casefiles/1/movements
  # GET casefiles/1/movements.json
  def index
    @casefile = Casefile.find(params[:casefile_id])
    @movements = @casefile.movements

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @movements }
    end
  end

  # GET casefiles/1/movements/1
  # GET casefiles/1/movements/1.json
  def show
     @courtstation = Courtstation.find(params[:courtstation_id])
    @casefile = @courtstation.casefiles.find(params[:casefile_id])
    @movement = @casefile.movements.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @movement }
    end
  end

  # GET casefiles/1/movements/new
  # GET casefiles/1/movements/new.json
  def new
    @courtstation = Courtstation.find(params[:courtstation_id])
    @casefile = @courtstation.casefiles.find(params[:casefile_id])
    @movement = @casefile.movements.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @movement }
    end
  end

  # GET casefiles/1/movements/1/edit
  def edit
    @courtstation = Courtstation.find(params[:courtstation_id])
    @casefile = @courtstation.casefiles.find(params[:casefile_id])
    @movement = @casefile.movements.find(params[:id])
  end

  # POST casefiles/1/movements
  # POST casefiles/1/movements.json
  def create
    @courtstation = Courtstation.find(params[:courtstation_id])
    @casefile = @courtstation.casefiles.find(params[:casefile_id])
    @movement = @casefile.movements.build(params[:movement])

    respond_to do |format|
      if @movement.save
        format.html { redirect_to([@casefile.courtstation,@movement.casefile, @movement], :notice => 'Movement was successfully created.') }
        format.json { render :json => @movement, :status => :created, :location => [@movement.casefile, @movement] }
      else
        format.html { render :action => "new" }
        format.json { render :json => @movement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT casefiles/1/movements/1
  # PUT casefiles/1/movements/1.json
  def update
    @courtstation = Courtstation.find(params[:courtstation_id])
    @casefile = @courtstation.casefiles.find(params[:casefile_id])
    @movement = @casefile.movements.find(params[:id])

    respond_to do |format|
      if @movement.update_attributes(params[:movement])
        format.html { redirect_to([@casefile.courtstation,@movement.casefile, @movement], :notice => 'Movement was successfully updated.') }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @movement.errors, :status => :unprocessable_entity }
      end
    end
  end
end
