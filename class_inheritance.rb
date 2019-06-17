
class Employee
  attr_reader :salary

  def initialize(name, title, salary, boss)
    @name, @title, @salary, @boss = name, title, salary, boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end

end


class Manager < Employee
  def initialize(name, title, salary, boss)
    super(name, title, salary, boss)
    @employees = []
  end

  def bonus(multiplier)
    total = []
    @employees.each {|employee| total << employee.salary}
    total.sum * multiplier
  end

  def employees=(person)
    @employees << person
  end
end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA manager", 78000, ned)
ned.employees = darren


shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)
darren.employees = shawna
darren.employees = david
ned.employees = shawna
ned.employees = david

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
