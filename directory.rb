@students = [] # an empty array accessible to all methods

def input_students
  puts "Starting student input."
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    student_input_loop(name)
    name = STDIN.gets.chomp
  end
  puts "Names successfully stored, thank you."
end

def student_input_loop(name)
  store_students(name)
  puts "Now we have #{@students.count} students"
end

def print_header
puts "The students of Villains"
puts "-------------"
end

def print
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to file"
  puts "4. Load the list from file"
  puts "5. Display this program's source code"
  puts "9. Exit"
end

def show_students
  print_header
  print
  print_footer
end

def menu_choice(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students(input_filename)
    when "4"
      load_students(input_filename)
    when "5"
      print_source
    when "9"
      exit # this will the program
    else
      puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    menu_choice(STDIN.gets.chomp)
  end
end

def save_students(filename)
  # open the file for writing
  File.open(filename, "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
end

def load_students(filename = "students.csv")
  File.open(filename, "r") do |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
      store_students(name, cohort)
    end
  end
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    filename = input_filename
  end
  load_students(filename)
  puts "Loaded #{@students.count} from students.csv"
end

def store_students(name, cohort = :november)
  @students << {name: name, cohort: cohort.to_sym}
end

def input_filename
  loop do
    filename = get_input
    if check_if_file_exists(filename)
      return filename
      break
    end
  end
end

def get_input
  puts "Please input a file to save/load, or leave blank to default to students.csv"
  user_input = STDIN.gets.chomp
  if user_input.downcase == "exit"
    exit
  elsif user_input == "" || user_input == nil
    user_input = "students.csv"
  end
  return user_input
end

def check_if_file_exists(filename)
  if File.exists?(filename)
    return true
  else
    puts "Error, no such file found."
    return false
  end
end



try_load_students
interactive_menu
