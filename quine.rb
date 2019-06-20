File.open("quine.rb", "r") do |file|
  file.readlines.each {|line| puts line}
end
