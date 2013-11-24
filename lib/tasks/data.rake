require 'csv'
namespace :data do 
	
	task :import_pizza => :environment do
		puts "Importing the Pizzas"

		CSV.foreach(Rails.root.join('data', 
			'pizza.csv')) do |row|
			puts row.inspect
			value = {
				:name => row[0],
				:lat => row[1].to_f,
				:lng => row[2].to_f
			}
		end
		Pizza.create( value )
		puts value.inspect
	end
end