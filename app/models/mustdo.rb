class Mustdo < ActiveRecord::Base

  belongs_to :user
  
  default_scope { order('created_at ASC') }

  def calculates_mustdos_days_left
    mustdo.created_at + 7.days - Time.now
  end

end
