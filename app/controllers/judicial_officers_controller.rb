class JudicialOfficersController < ApplicationController
  # GET /judicial_officers
  # GET /judicial_officers.json
  def index
    @judicial_officers = JudicialOfficer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @judicial_officers }
    end
  end

  # GET /judicial_officers/1
  # GET /judicial_officers/1.json
  def show
    @judicial_officer = JudicialOfficer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @judicial_officer }
    end
  end

  # GET /judicial_officers/new
  # GET /judicial_officers/new.json
  def new
    @judicial_officer = JudicialOfficer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @judicial_officer }
    end
  end

  # GET /judicial_officers/1/edit
  def edit
    @judicial_officer = JudicialOfficer.find(params[:id])
  end

  # POST /judicial_officers
  # POST /judicial_officers.json
  def create
    @judicial_officer = JudicialOfficer.new(params[:judicial_officer])

    respond_to do |format|
      if @judicial_officer.save
        format.html { redirect_to @judicial_officer, notice: 'Judicial officer was successfully created.' }
        format.json { render json: @judicial_officer, status: :created, location: @judicial_officer }
      else
        format.html { render action: "new" }
        format.json { render json: @judicial_officer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /judicial_officers/1
  # PUT /judicial_officers/1.json
  def update
    @judicial_officer = JudicialOfficer.find(params[:id])

    respond_to do |format|
      if @judicial_officer.update_attributes(params[:judicial_officer])
        format.html { redirect_to @judicial_officer, notice: 'Judicial officer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @judicial_officer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /judicial_officers/1
  # DELETE /judicial_officers/1.json
  def destroy
    @judicial_officer = JudicialOfficer.find(params[:id])
    @judicial_officer.destroy

    respond_to do |format|
      format.html { redirect_to judicial_officers_url }
      format.json { head :no_content }
    end
  end
end
