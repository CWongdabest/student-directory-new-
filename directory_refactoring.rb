 @students = []


 def interactive_menu 
  loop do 

  #1. print the menu and ask the user what to do 
  print_menu  
  
  #2. read the input and save it into a variable
  selection = STDIN.gets.chomp 
  
  #3. do what the user has asked 
  case selection
    when "1"
        input_students
    when "2"
        show_students
    when "3"
        save_students
    when "4"
        load_students
    when "9"
        exit # this will cause the program to terminate
    else 
        puts "I don't know what you meant, try again"
  end 
  #4. repeat from step 1
  end 
 end 
 
def print_menu 
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end 
 
def show_students
  print_header 
  print_students_list   
  print_footer
end 

def input_students
    puts "Please enter the names of the students and their respective cohorts"
    puts "To finish, just hit return twice"

    puts 'student name:'
    name = STDIN.gets.chomp 
    #get the first input 
    
    puts 'student cohort:'
    cohort = STDIN.gets.chomp 
    
    while !name.empty? || !cohort.empty? do 
        if !name.empty? && !cohort.empty? 
        @students << {name: name.to_sym, cohort: cohort.to_sym}
        elsif !name.empty? && cohort.empty? 
        @students << {name: name.to_sym, cohort: :no_info}
        elsif name.empty? && !cohort.empty?
        @students << {name: ("student #{@student.count}").to_sym, cohort: cohort.to_sym}
        end 
        
        if @students.count == 1
        puts "The new student you have entered is #{name.to_s} and they belong to cohort #{cohort.to_s}. Now we have 1 student. Do you want to make any changes to the name or the cohort? Please type '\yes'\ for any changes and any other key if you don\'t want to make any changes."
        else 
        puts "The new student you have entered is #{name.to_s} and they belong to cohort #{cohort.to_s}. Now we have #{@students.count} students. Do you want to make any changes to the name or the cohort? Please type '\yes'\ for any changes and any other key if you don\'t want to make any changes."
        end
        
        response = STDIN.gets.chomp.downcase 
        
        if response == 'yes'
            puts 'would you like to change the name or the cohort, or both?'
            response = STDIN.gets.chomp.downcase 
                if response == 'name'
                    puts 'please enter the student\'s name'
                    name = STDIN.gets.chomp 
                    @students.last.replace(name: name.to_sym, cohort: cohort.to_sym)
                elsif response == 'cohort'
                    puts 'please enter the student\'s cohort'
                    cohort = STDIN.gets.chomp 
                    @students.last.replace(name: name.to_sym, cohort: cohort.to_sym)
                elsif response == 'both'
                    puts 'please enter the student\'s name'
                    name = STDIN.gets.chomp 
                    puts 'please enter the student\'s cohort'
                    cohort = STDIN.gets.chomp 
                    @students.last.replace(name: name.to_sym, cohort: cohort.to_sym)
                end 
            puts "Student entry corrected. #{name} of #{cohort} cohort has been added to the database."
        end 
            

        puts "Please enter the name of the next student:"
        name = STDIN.gets.chomp 
        puts "Please enter the cohort of this student:"
        cohort = STDIN.gets.chomp 
    end 
end 


 
 
def print_header
  puts "The students of Villains Academy"
  puts "-----------"
end 
def print_students_list
    puts 'Which cohort of students would you like to show?'
    cohort_to_show = STDIN.gets.chomp 
    num = 0

    @students.map do |student|
      if (student[:cohort]).to_s == cohort_to_show
      num += 1 
      puts "#{num}. #{(student[:name]).to_s} (#{(student[:cohort]).to_s} cohort)"
      end
    end
end

def print_footer
   puts "Overall, we have #{@students.count} great students. "
end 

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
   end
   file.close 
end 

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(",")
    @students << {name: name.to_sym, cohort: cohort.to_sym}
  end 
  file.close
end 

def try_load_students
    filename = ARGV.first 
    return if filename.nil?
    if File.exists?(filename)
        load_students(filename)
        puts "Loaded #{@students.count} from #{filename}"
    else 
        puts "Sorry, #{filename} doesn't exist."
        exit 
    end 
end 
        
interactive_menu