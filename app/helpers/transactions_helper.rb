module TransactionsHelper
	require 'open-uri'

	def getPrices()
		# { "Gold" => 2000, "Silver" => 22 }
		prices = Hash.new
		web_page = open("http://www.kitco.com/texten/texten.html")
		begin
		  while line = web_page.gets
		    md = /^\s*(Gold|Silver|Platinum|Palladium)\s*(\d*\.\d\d)\s*(\d*\.\d\d)\s*([+-].*[%])\s*(\d*\.\d\d)\s*(\d*\.\d\d)/.match(line)
		    if md
		      print "#{md[1]}: Bid (#{md[2]}), Ask (#{md[3]}), Low (#{md[5]}, High (#{md[6]}))\n"
		      mark = ("#{md[2]}".to_f+"#{md[3]}".to_f)/2
		      key = case "#{md[1]}"
		        when "Gold" then 2
		        when "Silver" then 1
		        when "Platinum" then 3
		        when "Palladium" then 4
		      end 
		      prices[key] = mark

		    else
		      # Do Nothing
		    end
		  end

		rescue Exception   
		  STDERR.puts "Failed to download from kitco"
		  raise
		end
		prices		
	end
end
