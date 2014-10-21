class Task < ActiveRecord::Base
	def start!
	    self.started_at = Time.now
  	end

	def complete!
	    self.completed_at = Time.now
  	end

  	def self.new_task(desc)
  		self.create(description: desc)
  	end

end
