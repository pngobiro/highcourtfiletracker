class HearingcalenderController < ApplicationController
  def index
  end
 def todayhearings
 today = Date.today
   @casefiles = Casefile.today
  end
  
  def keshohearings
  @casefiles = Casefile.kesho
  end

  def thisweekhearings
   @casefiles = Casefile.weekthis
  end

  def thismonthhearings
    @casefiles = Casefile.kesho
  end
  
end

