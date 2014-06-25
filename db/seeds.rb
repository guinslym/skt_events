# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#require 'open-uri'

%w{open-uri faker nokogiri}.each { |x| puts require x }


#file is in app/assets/xml
file = Rails.root.join('app', 'assets', 'xml').to_s

#if the file is in app/assets/xml
doc = Nokogiri::XML(open(file + '/skatepark.xml').read){ |c| c.noblanks }


Location.delete_all

root = doc.root
#take all the children of root (all the document)
enfants = root.children

enfants.each do |n|
  petit_enfant = n.children
  attribute = {}
  comptage = 0 #why does it repeat twice #now it's ok I don't need this variable anymore
  petit_enfant.each do |n| 
  	comptage = comptage + 1
		if n.node_name.eql? "Suburbs"
			attribute[:suburbs] = n.content
		elsif n.node_name.eql? "Parkname"
			attribute[:parkname] = n.content
		elsif n.node_name.eql? "Address"
			attribute[:address] = n.content
		elsif n.node_name.eql? "Latitude"
			attribute[:latitude] = n.content
		elsif n.node_name.eql? "Longitude"
			attribute[:longitude] = n.content		
		end
		if attribute.count == 5
			puts attribute
		end
	end#do
	#if comptage == 1
		Location.create(attribute)
	#end
end

