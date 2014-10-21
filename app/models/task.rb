require_relative '../../config/application'

class Task < ActiveRecord::Base
	def start!
	    self.started_at = Time.now
  end

  def self.start!(id)
	    temptask = self.find(id)
	    temptask.started_at = Time.now
	    temptask.save
  end

	def self.complete!(id)
	    temptask = self.find(id)
	    if temptask.started_at == nil
	    	temptask.started_at = Time.now
	    end
	    temptask.completed_at = Time.now
	    temptask.save
  end

  def self.delete!(id)
	    self.find(id).destroy
  end

  def self.new_task(desc)
  		self.create(description: desc)
  end

end
