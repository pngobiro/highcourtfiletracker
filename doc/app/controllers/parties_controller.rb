class PartiesController < ApplicationController
  # GET casefiles/1/parties
  # GET casefiles/1/parties.json
  def index
    @casefile = Casefile.find(params[:casefile_id])
    @parties = @casefile.parties

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @parties }
    end
  end

  # GET casefiles/1/parties/1
  # GET casefiles/1/parties/1.json
  def show
    @casefile = Casefile.find(params[:casefile_id])
    @party = @casefile.parties.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @party }
    end
  end

  # GET casefiles/1/parties/new
  # GET casefiles/1/parties/new.json
  def new
    @casefile = Casefile.find(params[:casefile_id])
    @party = @casefile.parties.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @party }
    end
  end

  # GET casefiles/1/parties/1/edit
  def edit
    @casefile = Casefile.find(params[:casefile_id])
    @party = @casefile.parties.find(params[:id])
  end

  # POST casefiles/1/parties
  # POST casefiles/1/parties.json
  def create
    @casefile = Casefile.find(params[:casefile_id])
    @party = @casefile.parties.build(params[:party])

    respond_to do |format|
      if @party.save
        format.html { redirect_to([@party.casefile, @party], :notice => 'Party was successfully created.') }
        format.json { render :json => @party, :status => :created, :location => [@party.casefile, @party] }
      else
        format.html { render :action => "new" }
        format.json { render :json => @party.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT casefiles/1/parties/1
  # PUT casefiles/1/parties/1.json
  def update
    @casefile = Casefile.find(params[:casefile_id])
    @party = @casefile.parties.find(params[:id])

    respond_to do |format|
      if @party.update_attributes(params[:party])
        format.html { redirect_to([@party.casefile, @party], :notice => 'Party was successfully updated.') }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @party.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE casefiles/1/parties/1
  # DELETE casefiles/1/parties/1.json
 # def destroy
   # @casefile = Casefile.find(params[:casefile_id])
   # @party = @casefile.parties.find(params[:id])
   # @party.destroy

  #  respond_to do |format|
     # format.html { redirect_to casefile_parties_url(casefile) }
     # format.json { head :ok }
   # end
 # end
end
