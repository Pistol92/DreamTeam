require "mongo_mapper"
require "environment"

##
# Define your database name here
MongoMapper.database = "dreamteam_db"

tables_dir = File.expand_path("../../sandbox/tables/", __FILE__)
$:.unshift tables_dir
Dir.glob(tables_dir+"/*.rb").each do |table|
  require File.basename(table)
end