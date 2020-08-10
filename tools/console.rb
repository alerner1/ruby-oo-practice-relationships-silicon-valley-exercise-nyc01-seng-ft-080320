require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

buffet = VentureCapitalist.new("buffett", 3000000000)
bezos = VentureCapitalist.new("bezos", 9000000000)
gates = VentureCapitalist.new("gates", 750000000)
jobs = VentureCapitalist.new("jobs", 30000000)

slack = Startup.new("slack", "adam sandler", "chat")
teams = Startup.new("teams", "andy cook", "chat")
uber = Startup.new("uber", "kevin bacon", "driving")
airbnb = Startup.new("airbnb", "julia roberts", "hospitality")



binding.pry
0 #leave this here to ensure binding.pry isn't the last line