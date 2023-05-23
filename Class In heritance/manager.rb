require_relative 'employee'
class Manager < Employee
    def initialize(name, title, salary, boss)
        super(name, title, salary, boss)
        @employees = []
    end

    def bonus(multiplier)
        sum = 0 
        @employees.each do |employee|
            sum += (employee.salary * multiplier)
            if employee.is_a?(Manager)
                sum += employee.bonus(multiplier)
            end
        end
        sum
    end
    
    def add_employee(employee)
        @employees << employee
    end
end

