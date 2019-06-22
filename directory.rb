require "csv"

@students = []

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "\n1. Input the students"
  puts "2. Show the students"
  puts "3. save the list to students.csv"
  puts "4. load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    puts "--You choose Input the students--\n"
    input_students
  when "2"
    puts "--You choose Show the students--\n"
    show_students
  when "3"
    puts "--Save your file with a name--\n"
    filename = STDIN.gets.chomp
    save_students(filename)
    puts "\n--You saved your file as #{filename}"
  when "4"
    puts "--Choose a filename to load--\n"
    filename = STDIN.gets.chomp
    load_students(filename)
    puts "\n--#{filename} file Loaded--"
  when "9"
    puts "--BYE!--"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def insert_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def input_students
  gets_input
  display_names
  @students
end

def display_names
  while !@name.empty? do
    insert_students(@name, @cohort)
    puts "\nNow we have #{@students.count} students"
    gets_input
  end
end

def gets_input
    puts "\nPlease enter the names of the students"
    puts "To finish, just hit return twice"
    @name = STDIN.gets.chomp
    puts "Give me a cohort"
    @cohort = STDIN.gets.chomp
end

def print_header
  puts "\nThe students of Villains Academy"
  puts "-------------"
end

def save_students(filename = "students.csv")
  CSV.open(filename, "wb") do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort]]
    end
  end
end

def load_students(filename = "students.csv")
  CSV.foreach(filename, "r") do |line|
    name, cohort = line
    insert_students(name, cohort)
  end
end

def print_student_list
  @students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
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

def plural_or_singular
  string = "student"
  if @students.count > 1
    string + "s"
  else
    string
  end
end

def print_footer
  puts "\nOverall, we have #{@students.count} great #{plural_or_singular}"
end


interactive_menu
try_load_students
