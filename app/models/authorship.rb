class Authorship < ActiveRecord::Base
  belongs_to :batch
  belongs_to :casefile
end
