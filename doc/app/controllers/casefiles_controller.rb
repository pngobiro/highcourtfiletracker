class CasefilesController < ApplicationController
 before_filter :authenticate_user!
 # GET /casefiles
  # GET /casefiles.json
  def index
    @casefiles = Casefile.all


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @casefiles }
    end
  end

  # GET /casefiles/1
  # GET /casefiles/1.json
  def show
    @casefile = Casefile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @casefile }
    end
  end

  # GET /casefiles/new
  # GET /casefiles/new.json
  def new
    @casefile = Casefile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @casefile }
    end
  end

  # GET /casefiles/1/edit
  def edit
    @casefile = Casefile.find(params[:id])
  end

  # POST /casefiles
  # POST /casefiles.json
  def create
    @casefile = Casefile.new(params[:casefile])

    respond_to do |format|
      if @casefile.save
        format.html { redirect_to @casefile, notice: 'Casefile was successfully created.' }
        format.json { render json: @casefile, status: :created, location: @casefile }
      else
        format.html { render action: "new" }
        format.json { render json: @casefile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /casefiles/1
  # PUT /casefiles/1.json
  def update
    @casefile = Casefile.find(params[:id])

    respond_to do |format|
      if @casefile.update_attributes(params[:casefile])
        format.html { redirect_to @casefile, notice: 'Casefile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @casefile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /casefiles/1
  # DELETE /casefiles/1.json
  # def destroy
   # @casefile = Casefile.find(params[:id])
   # @casefile.destroy

   # respond_to do |format|
      # format.html { redirect_to casefiles_url }
     # format.json { head :no_content }
   # end
 # end
 def agefiled
  now = Date.today
  fileddate = @casefile.DateofFilling
  datediff = now-fileddate
  return datediff
end
end