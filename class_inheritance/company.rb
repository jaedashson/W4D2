require "byebug"

require_relative "employee"
require_relative "manager"

shawna = Employee.new("Shawna", "TA", 12000)
david = Employee.new("David", "TA", 10000)
darren = Manager.new("Darren", "TA Manager", 78000)
ned = Manager.new("Ned", "Founder", 1000000)

ned.employees = [darren]
darren.boss = ned

darren.employees = [shawna, david]
shawna.boss = darren
david.boss = darren

# p ned.employees

# debugger
p ned.bonus(5) # => 500000
p darren.bonus(4) # => 88000
p david.bonus(3) # => 30000