class Players
  include MongoMapper::Document
  key :name, String
  key :score, Float
  key :date, Time
  key :team, String
  key :position, String
  key :competition, String
end