#!/usr/bin/env ruby
%w[optparse json fileutils mongo].each do |lib|
	require lib
end
#-------------------------------------------------------------

def terminate_prog(msg)
  puts msg
  exit(1)
end

# parse command line arguments
# User will run this script as ./main -f ./data.js -d super_app
options = {:json_file => nil, :db_name => nil}

parser = OptionParser.new() do |opts|
  opts.on('-j', '--json_file file', 'Json file') do |json|
    options[:json_file] = json

    terminate_prog("File does not exists") if not File.exist?(options[:json_file])
    terminate_prog("Not a file") if not File.file?(options[:json_file])
  end
  
	opts.on('-d', '--db_name name', 'Database Name') do |name|
		options[:db_name] = name
	end  
end
parser.parse!()

# open json file
json_data = JSON.parse(File.read(options[:json_file]))
db = Mongo::Client.new([ '127.0.0.1:27017' ], :database => options[:db_name], :connect => :direct)

# collections to import in database
# replace this with yours
COLLECTIONS = %w[domains users experiences apps APIs datasources users salesOwners cloudProviders apiMgmtPlatforms sandboxe]

# start importing....
COLLECTIONS.each do |collection_name|
	db[collection_name].find({}).delete_many()
	json_data[collection_name].each do |collection_item|
		db[collection_name].insert_one(collection_item)
	end
end

db.close()
