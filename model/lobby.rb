
class Lobby < Room
  attr_reader :name, :enter_text, :exit_text, :description

  def initialize
    super
    @name         = "Lobby"
    @enter_text   = "You are standing in the lobby of an office building."
    @exit_text    = "As the elevator doors open you are temporarily blinded by a brilliant light."
    @description  = "You are standing in the lobby of an office building. To your left is a security guard. In front of you is a a row of elevators. Behind you is the door leading out of the building."
    @elevator = false
  end

  def test(input)
  	puts "SUCCESS!"
  end

  def enter(input)
  	unless input.include?('elevator')
  		puts "Enter what?"
  	else
	  	@description = "You are standing in an elevator. There are buttons numbered from 1-7."
	  	@elevator = true
	  	puts "You enter the elevator."
	end
  end

  def press(input)
  	unless @elevator = true
  		puts "You see nothing to press."
  	else
  		input.each do |command|
  			if ['1','2','3','4','5','7'].include?(command)
  				puts "You press the button for floor #{command}. As you step out of the elevator you realize that you're on the wrong floor. You turn around to step back into the elevator, but it's too late. You are eaten by wolves."


  			elsif command == '6'
  				puts "You press the button for floor #{command}."
  				solve
  				return true
  			end
  		end
  		puts "I don't think I can press that..."
  	end
  end



end
