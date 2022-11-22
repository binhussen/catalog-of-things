require_relative './task'

def main
  task = Task.new
  loop do
    task.choose_task
    input = gets.chomp.to_i
    if input == 10
      puts 'Thank you for using this app!'
      break
    end
    task.do_task(input)
  end
end

main
