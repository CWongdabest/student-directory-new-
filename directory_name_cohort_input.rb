def input_students
    puts "Please enter the names of the students and their respective cohorts"
    puts "To finish, just hit return twice"
    students = []
    
    puts 'student name:'
    name = gets.chomp 
    #get the first input 
    
    puts 'student cohort:'
    cohort = gets.chomp 
    
    while !name.empty? || !cohort.empty? do 
        if !name.empty? && !cohort.empty? 
        students << {name: name.to_sym, cohort: cohort.to_sym}
        elsif !name.empty? && cohort.empty? 
        students << {name: name.to_sym, cohort: :no_info}
        elsif name.empty? && !cohort.empty?
        students << {name: ("student #{student.count}").to_sym, cohort: cohort.to_sym}
        end 
        
        if students.count == 1
        puts "The new student you have entered is #{name.to_s} and they belong to cohort #{cohort.to_s}. Now we have 1 student. Do you want to make any changes to the name or the cohort? Please type '\yes'\ for any changes and any other key if you don\'t want to make any changes."
        else 
        puts "The new student you have entered is #{name.to_s} and they belong to cohort #{cohort.to_s}. Now we have #{students.count} students. Do you want to make any changes to the name or the cohort? Please type '\yes'\ for any changes and any other key if you don\'t want to make any changes."
        end
        
        response = gets.chomp.downcase 
        
        if response == 'yes'
            puts 'would you like to change the name or the cohort, or both?'
            response = gets.chomp.downcase 
                if response == 'name'
                    puts 'please enter the student\'s name'
                    name = gets.chomp 
                    students.last.replace(name: name.to_sym, cohort: cohort.to_sym)
                elsif response == 'cohort'
                    puts 'please enter the student\'s cohort'
                    cohort = gets.chomp 
                    students.last.replace(name: name.to_sym, cohort: cohort.to_sym)
                elsif response == 'both'
                    puts 'please enter the student\'s name'
                    name = gets.chomp 
                    puts 'please enter the student\'s cohort'
                    cohort = gets.chomp 
                    students.last.replace(name: name.to_sym, cohort: cohort.to_sym)
                end 
            puts "Student entry corrected. #{name} of #{cohort} cohort has been added to the database."
        end 
            

        puts "Please enter the name of the next student:"
        name = gets.chomp 
        puts "Please enter the cohort of this student:"
        cohort = gets.chomp 
    end 
    
    #return an array of students 
    students
end 

def print_header
  puts "The students of Villains Academy"
  puts "-----------"
end 

def print(students)
    puts 'Which cohort of students would you like to show?'
    cohort_to_show = gets.chomp 
    num = 0
    
    student_in_cohort = []

    students.map do |student|
      if (student[:cohort]).to_s == cohort_to_show
      num += 1 
      puts "#{num}. #{(student[:name]).to_s} (#{(student[:cohort]).to_s} cohort)"
      student_in_cohort << student 
      end
    end
    
    return student_in_cohort 
end

def print_footer(names)
   puts "Overall, we have #{names.count} great students. "
end 

students = input_students
print_header
print(students)
puts
print_footer(students)