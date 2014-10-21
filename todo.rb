require_relative 'config/application'
require_relative 'app/models/task'

# puts "Put your application code in #{File.expand_path(__FILE__)}"

class TodoProgram

	def self.run
    @input_command = ARGV
 		do_option
  end

	def self.do_option
		case @input_command[0]
	    when "list"
	    	puts "Here are your tasks"
	      Task.all.each do |task|
	      	status = "\n   [not started - created at: #{task.created_at}]"
	      	if task.started_at != nil
	      		status = "\n   [started at: #{task.started_at}]"
	      	end
	      	if task.completed_at != nil
	      		status = "\n   [completed at: #{task.completed_at}]"
	      	end
	      	puts "#{task.id} : #{task.description} #{status}"
	      end
	    when "add"
	      temptask = @input_command[1..-1].join(" ")
	      Task.new_task(temptask)
	    when "start"
	       Task.start!(@input_command[1])
	    when "complete"
	       Task.complete!(@input_command[1])
	    when "delete"
	       Tasks.delete(@input_command[1])
	   	else
	      puts "Wrong Input Option"
	      puts "Available options are:"
	      puts "  list"
	      puts "  add TASK_DESCRIPTION"
	      puts "  start TASK_ID"
	      puts "  complete TASK_ID"
	      puts "  delete TASK_ID"
	    end

	end

end

TodoProgram.run

