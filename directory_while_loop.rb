def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    
    students = []
    
    name = gets.chomp 
    #get the first input 
    
    while !name.empty? do 
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        
        name = gets.chomp 
    end 
    
    #return an array of students 
    students
end 

def print_header
  puts "The students of Villains Academy"
  puts "-----------"
end 

def print(students)
    num = 0 
    
    while num != students.length 
       
      puts "#{num + 1}. #{students[num][:name]} (#{students[num][:cohort]} cohort)"
      num += 1 
    end
    
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students."
end 

students = input_students
print_header
print(students)
print_footer(students)