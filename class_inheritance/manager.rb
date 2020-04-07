require_relative "employee"

class Manager < Employee

    attr_accessor :employees
  
    def initialize(name, title, salary, boss=nil, employees=nil)
        super(name, title, salary, boss)
        @employees = employees
    end


    def bonus(multiplier)        
        subordinate_sum * multiplier
    end    

    def subordinate_sum
        subordinate_sum = 0
        # return 0 if employees.length < 1
        self.employees.each do |employee|
            if employee.is_a?(Manager)
                subordinate_sum += employee.salary
                subordinate_sum += employee.subordinate_sum
            else
                subordinate_sum += employee.salary
            end
        end
        subordinate_sum
    end
end


    # # Original with Queue
    # def bonus(multiplier)
    #     return salary * multiplier if employees.length < 1 # unnecessary base case?
        
    #     subordinate_sum = 0

    #     queue = employees

    #     until queue.empty?
    #         current_employee = queue.shift

    #         subordinate_sum += current_employee.salary

    #         if current_employee.is_a?(Manager)
    #             queue.push(current_employee.employees)
    #         end
    #     end

    #     # employees.each do |employee|
    #     #     subordinate_sum += employee.salary

    #     #     if employee.is_a?(Manager)
    #     #         employees.push(employee.employees)
    #     #     end
    #     # end

        
    #     subordinate_sum * multiplier
    # end