require_relative 'config/application'
require_relative 'app/controllers/tasks_controller'

# puts "Put your application code in #{File.expand_path(__FILE__)}"

class TodoProgram

	def self.run
    @input_command = ARGV
 		do_option
  end
  
	def self.do_option
		case @input_command[0]
	    when "list"
	    	TasksController.list

	    when "list_not_started"
	    	TasksController.list_not_started

	    when "list_started"
	    	TasksController.list_started

	    when "list_completed"
	    	TasksController.list_completed

	    when "add"
	      TasksController.add(@input_command[1..-1].join(" "))

	    when "start"
	    	TasksController.start(@input_command[1])
	    when "complete"
	    	TasksController.completed(@input_command[1])

	    when "delete"
	    	TasksController.delete(@input_command[1])
	   	else
				TasksController.wrong_input
				
	    end
	end
end

TodoProgram.run

