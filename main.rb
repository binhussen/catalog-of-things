require './app'

def main
  app = App.new
  loop do
    app.choose_task
    input = gets.chomp.to_i
    if input == 10
      puts 'Thank you for using this app!'
      break
    end
    app.do_task(input)
  end
end

main
