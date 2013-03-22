require "ajaila/selectors"
file = import "players.csv"

Players.collection.remove

CSV.foreach file do |row|
  name = row[4]
  score = row[3]
  pre_date = row[0].split("/")
  date = Time.new(2000+pre_date[2].to_f, pre_date[1].to_f, pre_date[0].to_f)
  team = row[6]
  position = row[5]
  competition = row[2]
  puts "name: #{name}, score: #{score}, date:#{date}, team: #{team}, position: #{position}, competition: #{competition}"
  Players.create(name: name, score: score, date: date, team: team, position: position, competition: competition)
end
