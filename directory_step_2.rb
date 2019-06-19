def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def print_student_info_with_while_loop(student_info)
  counter = 0
  while counter < student_info.length  do
    puts " #{counter + 1}. #{student_info[counter][:name]} (#{student_info[counter][:cohort]} cohort)"
    counter += 1
  end
end

# def filter(students)
#   students.map do |student|
#       if student[:name].length < 12
#           student[:name]
#       end
        # key.map do |k, v|
      #     if v.length < 12
      # puts v
       # end
#     # end
#   end.compact
# end



def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
#nothing happens until we call the methods
students = input_students
print_header
puts(students)
print_footer(students)
