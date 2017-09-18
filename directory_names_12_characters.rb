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
        
    twelve_characters = []

    students.each do |student|
         if (student[:name]).split(' ').join.length < 12
          twelve_characters << student
         end
    end 
    \
    puts 'Here are the students with their names shorter than 12 characters:'

    twelve_characters.each_with_index do |student, index|
          
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end 

end

def print_footer(names)
    
    num = 0 
    
   names.each do |student|
     
     if student[:name].split(' ').join.length < 12
         num += 1
     else 
         num += 0
     end 
   end 
   
   puts "Overall, we have #{names.count} great students, including #{num} students with their names shorter than 12 characters."
end 

students = input_students
print_header
print(students)
print_footer(students)