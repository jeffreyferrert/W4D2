class Employee
    attr_reader :salary
    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
        @boss.add_employee(self) if !@boss.nil?
    end

    def bonus(multiplier)
        @salary * multiplier 
    end

end