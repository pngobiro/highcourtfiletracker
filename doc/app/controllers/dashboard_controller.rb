class DashboardController < ApplicationController
 before_filter :authenticate_user!
 def login
  end

  def allcases
  end

  def pendingcases
      @casefiles = Casefile.pending

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @casefiles }
    end
  end

  def completedcases
     @casefiles = Casefile.completed

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @casefiles }
    end
  end

  def transfaredcases
      @casefiles = Casefile.Transfered

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @casefiles }
    end
  end

  def reports
  @pendingcount = Casefile.pending.count
  @completedcount = Casefile.completed.count
  @transferedcount = Casefile.transfered.count
  @twentyago = Casefile.twentyago.count
  @filed2005to2009 = Casefile.filed2005to2009.count
  @filed2010to2012 = Casefile.filed2010to2012.count
  @filed2013to2015 = Casefile.filed2013to2015.count
  @over12 = Casefile.over12.pending.count
  @btw7to12 = Casefile.btw7to12.pending.count
  @btw3to6 =Casefile.btw3to6.pending.count
  @btw1to2 = Casefile.btw1to2.pending.count
  @lessthan1 = Casefile.lessthan1.pending.count
  end
  def searchcase
  end

  def courtcalender
  end
end
