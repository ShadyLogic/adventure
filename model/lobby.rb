
class Lobby < Room

  def initialize
    super
    @name         = "Lobby"
    @description  = "You are standing in the lobby of an office building. To your left is a security guard watching TV. In front of you is a row of elevators. Behind you is the door leading out of the building."
    @view 		  = Image.lobby
    @elevator 	  = false
    @guard 		  = false
  end

  def enter(input)
  	if input.include?('elevator')
  		go_elevator
  	elsif input.include?('guard') || input.include?('security')
  		go_guard
  	elsif input.include?('lobby')
  		go_lobby
  	elsif input.include?('away')
  		exit(input)
  	elsif input.include?('outside')
  		exit(input)
  	else
  		puts "You want to go where?"
	end
  end

  def press(input)
  	unless @elevator == true
  		puts "You see nothing to press."
  	else
  		input.each do |command|
  			if ['1','2','3','4','5','7'].include?(command)
  				wolf_attack(command)
  			elsif command == '6'
  				puts "You press the button for floor #{command}."
  				puts "As the elevator doors open you are temporarily blinded by a brilliant light."
  				solve
  				return true
  			end
  		end
  		if input.include?('button')
  			puts "Push which button?"
  			return true
  		end
  		puts "I don't think I can press that..."
  	end
  end

  def say(input)
  	if @guard == true || input.include?('guard') || input.include?('security')
  		puts Image.guard_wave
  		puts
  		puts "You try to be friendly, but the guard simply smiles and waves."
  	else
  		puts "Who are you talking to?"
  	end
  end

  def wave(input)
  	if @guard == true || input.include?('guard') || input.include?('security')
  		puts Image.guard_wave
  		puts
  		puts "Without taking his eyes off the TV the guard smiles and waves back."
  	else
  		puts "You wave your arms in the air like a madperson."
  	end
  end

  def exit(input)
  	if @elevator == true
  		puts "You exit the elevator."
  		go_lobby
  		return true
  	elsif @guard == true
  		puts "You walk away from the guard."
  		go_lobby
  		return true
  	else
  		hit_by_car
  	end

  end

  def talk(input)
  	say(input)
  end

  def push(input)
  	press(input)
  end

  def go(input)
  	enter(input)
  end

  def approach(input)
  	enter(input)
  end

  def leave(input)
  	exit(input)
  end

  private

  def hit_by_car
  	puts Image.car
  	puts
  	puts "You step outside the building and are immediately hit by a car."
  	puts "Guess going home before 6 wasn't such a good idea..."
  	gameover
  end

  def wolf_attack(floor)
  	puts Image.wolf_1
  	puts "You press the button for floor #{floor}."
  	puts "As you step out of the elevator you realize that you're in the wrong place, this isn't DBC!"
  	puts "You turn around to step back into the elevator, but it's too late."
  	puts "You are eaten by wolves."
  	gameover
  end

  def go_lobby
  	if @guard == false && @elevator == false
  		puts "You begin walking in circles."
  		return true
  	end
  	puts "You step back into the lobby."
  	@description  = "You are standing in the lobby of an office building. To your left is a security guard watching TV. In front of you is a row of elevators. Behind you is the door leading out of the building."
  	@elevator = false
  	@guard = false
  	@view = Image.lobby
  end

  def go_guard
  	if @guard == true
  		puts "You bump into the guard, who shows no sign of caring."
  		return true
  	end
  	puts "You approach the guard."
  	@description = "The guard is watching TV. He hardly seems to notice you."
  	@guard = true
  	@elevator = false
  	@view = Image.guard
  end

  def go_elevator
	if @elevator == true
		puts "You are already in the elevator, silly."
		return true
	end
	puts "You enter the elevator."
	@description = "You are standing in an elevator. There are buttons numbered from 1-7."
	@elevator = true
	@guard = false
	@view = Image.elevator
  end

end
