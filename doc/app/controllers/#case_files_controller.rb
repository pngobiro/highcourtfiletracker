class CaseFilesController < ApplicationController
  # GET /case_files
  # GET /case_files.json
  def index
    @case_files = CaseFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @case_files }
    end
  end

  # GET /case_files/1
  # GET /case_files/1.json
  def show
    @case_file = CaseFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @case_file }
    end
  end

  # GET /case_files/new
  # GET /case_files/new.json
  def new
    @case_file = CaseFile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @case_file }
    end
  end

  # GET /case_files/1/edit
  def edit
    @case_file = CaseFile.find(params[:id])
  end

  # POST /case_files
  # POST /case_files.json
  def create
    @case_file = CaseFile.new(params[:case_file])

    respond_to do |format|
      if @case_file.save
        format.html { redirect_to @case_file, notice: 'Case file was successfully created.' }
        format.json { render json: @case_file, status: :created, location: @case_file }
      else
        format.html { render action: "new" }
        format.json { render json: @case_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /case_files/1
  # PUT /case_files/1.json
  def update
    @case_file = CaseFile.find(params[:id])

    respond_to do |format|
      if @case_file.update_attributes(params[:case_file])
        format.html { redirect_to @case_file, notice: 'Case file was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @case_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /case_files/1
  # DELETE /case_files/1.json
  def destroy
    @case_file = CaseFile.find(params[:id])
    @case_file.destroy

    respond_to do |format|
      format.html { redirect_to case_files_url }
      format.json { head :no_content }
    end
  end
end
