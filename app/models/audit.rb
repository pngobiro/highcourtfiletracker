class Audit < ActiveRecord::Base
belongs_to :user
  attr_accessible :auditable_type,:user_id,:action,:audited_changes,:remote_address,:created_at
self.per_page = 10
scope:trackertype, where("auditable_type"=> "Tracker")
scope:order_latest, order("created_at DESC")
end
