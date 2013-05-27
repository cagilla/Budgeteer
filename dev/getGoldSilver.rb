#---
# Excerpted from "Programming Ruby 1.9",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/ruby3 for more book information.
#---
require 'open-uri'

web_page = open("http://www.kitco.com/texten/texten.html")
begin
  while line = web_page.gets
    md = /^\s*(Gold|Silver)\s*(\d*\.\d\d)\s*(\d*\.\d\d)\s*([+-].*[%])\s*(\d*\.\d\d)\s*(\d*\.\d\d)/.match(line)
    if md
      print "#{md[1]}: Bid (#{md[2]}), Ask (#{md[3]}), Low (#{md[5]}, High (#{md[6]}))\n"
    else
      # Do Nothing
    end
  end

rescue Exception   
  STDERR.puts "Failed to download from kitco"
  raise
end