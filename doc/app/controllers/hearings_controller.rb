class HearingsController < ApplicationController
  # GET casefiles/1/hearings
  # GET casefiles/1/hearings.json
  def index
    @casefile = Casefile.find(params[:casefile_id])
    @hearings = @casefile.hearings.order("created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @hearings }
    end
  end

  # GET casefiles/1/hearings/1
  # GET casefiles/1/hearings/1.json
  def show
    @casefile = Casefile.find(params[:casefile_id])
    @hearing = @casefile.hearings.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @hearing }
    end
  end

  # GET casefiles/1/hearings/new
  # GET casefiles/1/hearings/new.json
  def new
    @casefile = Casefile.find(params[:casefile_id])
    @hearing = @casefile.hearings.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @hearing }
    end
  end

  # GET casefiles/1/hearings/1/edit
  def edit
    @casefile = Casefile.find(params[:casefile_id])
    @hearing = @casefile.hearings.find(params[:id])
  end

  # POST casefiles/1/hearings
  # POST casefiles/1/hearings.json
  def create
    @casefile = Casefile.find(params[:casefile_id])
    @hearing = @casefile.hearings.build(params[:hearing])

    respond_to do |format|
      if @hearing.save
        format.html { redirect_to([@hearing.casefile, @hearing], :notice => 'Hearing was successfully created.') }
        format.json { render :json => @hearing, :status => :created, :location => [@hearing.casefile, @hearing] }
      else
        format.html { render :action => "new" }
        format.json { render :json => @hearing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT casefiles/1/hearings/1
  # PUT casefiles/1/hearings/1.json
  def update
    @casefile = Casefile.find(params[:casefile_id])
    @hearing = @casefile.hearings.find(params[:id])

    respond_to do |format|
      if @hearing.update_attributes(params[:hearing])
        format.html { redirect_to([@hearing.casefile, @hearing], :notice => 'Hearing was successfully updated.') }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @hearing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE casefiles/1/hearings/1
  # DELETE casefiles/1/hearings/1.json
  def destroy
    @casefile = Casefile.find(params[:casefile_id])
    @hearing = @casefile.hearings.find(params[:id])
    @hearing.destroy

    respond_to do |format|
      format.html { redirect_to casefile_hearings_url(casefile) }
      format.json { head :ok }
    end
  end
end
