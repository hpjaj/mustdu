class Mustdo < ActiveRecord::Base

  belongs_to :user
  
  default_scope { order('created_at ASC') }

  def days_left
    ((self.created_at + 7.days - Time.now) / ( 60 * 60 * 24)).round
  end
  
end
