require 'csv'    

task :load_Transaction_csv => :environment do
	filename = "public/assets/checkbook.csv"

	CSV.foreach(filename, :headers => true) do |row|
	  Transaction.create!(row.to_hash)
	end

end