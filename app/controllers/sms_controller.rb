class SmsController < ApplicationController
  before_filter :set_sm, only: [:show, :update]
  respond_to :html, :xml, :json
  def index
    @sms = Sm.all
    respond_with(@sms)
  end

  def show
    respond_with(@sm)
  end

  def new
    @sm = Sm.new
    respond_with(@sm)
  end


  def create
    @sm = Sm.new(params[:sm])
    @sm.save
    respond_with(@sm)
  end

  def update
    @sm.update_attributes(params[:sm])
    respond_with(@sm)
  end

  private
    def set_sm
      @sm = Sm.find(params[:id])
    end
end
