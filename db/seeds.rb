require 'faker'
require_relative '../config/application'
require_relative '../app/models/task'



10.times do
		Task.new_task(Faker::Company.bs)
		# puts Faker::Hacker.say_something_smart
end