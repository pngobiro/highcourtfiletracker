class CasefilesController < ApplicationController
before_filter :authenticate_user!
  # GET courtstations/1/casefiles
  # GET courtstations/1/casefiles.json

def index
    @courtstation = Courtstation.find(params[:courtstation_id])
    @case1 = @courtstation.casefiles
 	if params[:q].blank?
	@q = @case1.none.ransack # so you have a ransack search
	else
	@q = @case1.ransack(params[:q])
	end
	@casefiles = @q.result

	    respond_to do |format|
	      format.html # index.html.erb
	      format.json { render :json => @casefiles }
	    end
  end

  # GET courtstations/1/casefiles/1
  # GET courtstations/1/casefiles/1.json
  def show
    @courtstation = Courtstation.find(params[:courtstation_id])
    @casefile = @courtstation.casefiles.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @casefile }
    end
  end

  # GET courtstations/1/casefiles/new
  # GET courtstations/1/casefiles/new.json
  def new
    @courtstation = Courtstation.find(params[:courtstation_id])
    @casefile = @courtstation.casefiles.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @casefile }
    end
  end

  # GET courtstations/1/casefiles/1/edit
  def edit
    @courtstation = Courtstation.find(params[:courtstation_id])
    @casefile = @courtstation.casefiles.find(params[:id])
  end

  # POST courtstations/1/casefiles
  # POST courtstations/1/casefiles.json
  def create
    @courtstation = Courtstation.find(params[:courtstation_id])
    @casefile = @courtstation.casefiles.build(params[:casefile])

    respond_to do |format|
      if @casefile.save
        format.html { redirect_to([@casefile.courtstation, @casefile], :notice => 'Casefile was successfully created.') }
        format.json { render :json => @casefile, :status => :created, :location => [@casefile.courtstation, @casefile] }
      else
        format.html { render :action => "new" }
        format.json { render :json => @casefile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT courtstations/1/casefiles/1
  # PUT courtstations/1/casefiles/1.json
  def update
    @courtstation = Courtstation.find(params[:courtstation_id])
    @casefile = @courtstation.casefiles.find(params[:id])

    respond_to do |format|
      if @casefile.update_attributes(params[:casefile])
        format.html { redirect_to([@casefile.courtstation, @casefile], :notice => 'Casefile was successfully updated.') }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @casefile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE courtstations/1/casefiles/1
  # DELETE courtstations/1/casefiles/1.json
  def destroy
    @courtstation = Courtstation.find(params[:courtstation_id])
    @casefile = @courtstation.casefiles.find(params[:id])
    @casefile.destroy

    respond_to do |format|
      format.html { redirect_to courtstation_casefiles_url(courtstation) }
      format.json { head :ok }
    end
  end
end
