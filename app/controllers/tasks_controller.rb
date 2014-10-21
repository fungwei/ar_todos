require_relative '../../config/application'
require_relative '../../app/models/task'

class TasksController
  def self.list
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
  end

  def self.list_not_started
    puts "Here are your tasks that have not been started"
    Task.where(started_at: nil).each do |task|
      status = "\n   [not started - created at: #{task.created_at}]"
      if task.started_at != nil
        status = "\n   [started at: #{task.started_at}]"
      end

      if task.completed_at != nil
        status = "\n   [completed at: #{task.completed_at}]"
      end

      puts "#{task.id} : #{task.description} #{status}"
    end
  end

  def self.list_started
    puts "Here are your tasks that have not been started"
    Task.where(completed_at: nil).where("started_at IS NOT NULL").each do |task|
      status = "\n   [not started - created at: #{task.created_at}]"
      if task.started_at != nil
        status = "\n   [started at: #{task.started_at}]"
      end
      if task.completed_at != nil
        status = "\n   [completed at: #{task.completed_at}]"
      end
      puts "#{task.id} : #{task.description} #{status}"
    end
  end

  def self.list_completed
    puts "Here are your tasks that have not been started"
    Task.where("completed_at IS NOT NULL").each do |task|
      status = "\n   [not started - created at: #{task.created_at}]"
      if task.started_at != nil
        status = "\n   [started at: #{task.started_at}]"
      end
      if task.completed_at != nil
        status = "\n   [completed at: #{task.completed_at}]"
      end
      puts "#{task.id} : #{task.description} #{status}"
    end
  end

  def self.add(task_description)
    if task_description.length > 1
    Task.new_task(task_description)
    else
      puts "You didnt write a task after \"add\". \nInput example. \"add do my math homework\"" 
    end
  end

  def self.start(id)
    if Task.exists?(id)
      Task.start!(id)
    else
      puts "Sorry the ID you provided does not exist, please list tasks to see all tasks"
    end
  end

  def self.completed(id)
    if Task.exists?(id)
      Task.complete!(id)
     else
      puts "Sorry the ID you provided does not exist, please list tasks to see all tasks"
    end
  end

  def self.delete(id)
    if Task.exists?(id)
      Task.delete(id)
     else
      puts "Sorry the ID you provided does not exist, please list tasks to see all tasks"
    end
  end

  def self.wrong_input
    puts "Wrong Input Option"
    puts "Available options are:"
    puts "  list"
    puts "  list_not_started"
    puts "  list_started"
    puts "  list_completed"
    puts "  add TASK_DESCRIPTION"
    puts "  start TASK_ID"
    puts "  complete TASK_ID"
    puts "  delete TASK_ID"
  end

end