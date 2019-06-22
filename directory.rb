def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first names
  puts "What is your name"
  name = gets
  name[-1] = ""
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student to the hash array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets
    name[-1] = ""
  end
  # return the array of students
  students
end

def print_header
puts "The students of Villains"
puts "-------------"
end

def print(students)
  students_by_cohort = {}
  students.each do |student|
    if students_by_cohort[student[:cohort]] == nil
      students_by_cohort[student[:cohort]] = []
    end
    students_by_cohort[student[:cohort]].push(student[:name])

    # puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
  puts students_by_cohort.flatten
end

def print_footer(names)
  if names.count > 1
    puts "Overall, we have #{names.count} great students"
  elsif names.count == 1
    puts "Overall, we have #{names.count} great student"
  end
end

students = input_students
print_header
print(students)
print_footer(students)
