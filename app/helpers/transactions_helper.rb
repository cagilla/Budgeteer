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
		      prices["#{md[1]}"] = mark

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
