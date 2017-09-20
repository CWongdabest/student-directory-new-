def input_students
    puts "Please enter the names, hobbies, and nationality of the students"
    puts "To finish, just hit return twice"
    
    students = []
    
    name = gets.chomp 
    
    puts 'Please enter the student\'s hobbies:'
    hobbies = gets.chomp 
    
    puts 'Please enter the student\'s nationality:'
    nationality = gets.chomp 
    #get the first input 
    
    while !name.empty? do 
        students << {name: name, cohort: :november, hobbies: hobbies, nationality: nationality}
        puts "Now we have #{students.count} students"
        puts "Please enter the name of the next student:"
        name = gets.chomp 
        if name.empty?
            break
        end 
        puts "Please enter the hobbies of this student:"
        hobbies = gets.chomp 
        puts "Please enter the nationality of this student:"
        nationality = gets.chomp 
    end 
    
    #return an array of students 
    students
end 

def print_header
  puts "The students of Villains Academy"
  puts "-----------"
end 

def print(students)
    line_length = 90 
    students.each_with_index do |student, index|
      puts ("#{index + 1}. #{student[:name]}, #{student[:nationality]}").ljust(line_length/3) + ("(#{student[:cohort]} cohort)").ljust(line_length/3) + ("(hobbies: #{student[:hobbies]})").rjust(line_length/3)
    end
end

def print_footer(names)
   puts "Overall, we have #{names.count} great students and they all have interesting hobbies."
end 

students = input_students
print_header
print(students)
print_footer(students)