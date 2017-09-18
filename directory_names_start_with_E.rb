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
        
    begins_with_E = []

    students.each do |student|
         if (student[:name])[0] == 'E'
          begins_with_E << student
         end
    end 
    \
    puts 'Here are the students with their name beginning with \'E\''

    begins_with_E.each_with_index do |student, index|
          
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end 

end

def print_footer(names)
    
    num = 0 
    
   names.each do |student|
     
     if student[:name][0] == 'E'
         num += 1
     else 
         num += 0
     end 
   end 
   
   puts "Overall, we have #{names.count} great students, including #{num} students with their names beginning with an 'E'."
end 

students = input_students
print_header
print(students)
print_footer(students)