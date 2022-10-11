def check(brackets)
  puts "Incoming brackets-string: #{brackets.join("")}"

  if brackets.length % 2 != 0
    return false
  end

  open_brackets = ["(", "{", "["]
  closed_brackets = [")", "}", "]"]
  stack = []

  brackets.each do |el|
    open_index = open_brackets.index(el)

    unless open_index.nil?
      stack.push(open_index)
      next
    end

    closed_index = closed_brackets.index(el)

    unless closed_index.nil?
      open_index = stack.pop
      return false unless open_index == closed_index
    end

    return true
  end
end

puts "Brackets checking!"
puts "Enter brackets one by one."
brackets = []

while true do
  user_input = ""

  while user_input.empty?
    user_input = STDIN.gets.encode("UTF-8").chomp.downcase
  end

  if user_input == "x"
    puts "Result of checking: #{check(brackets)}"
    exit 0
  else
    brackets << user_input
  end
end

