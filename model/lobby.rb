
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
  		@client.puts "You want to go where?"
	end
  end

  def press(input)
  	unless @elevator == true
  		@client.puts "You see nothing to press."
  	else
  		input.each do |command|
  			if ['1','2','3','4','5','7'].include?(command)
  				wolf_attack(command)
  			elsif command == '6'
  				@client.puts "You press the button for floor #{command}."
  				@client.puts "As the elevator doors open you are temporarily blinded by a brilliant light."
  				solve
  				return true
  			end
  		end
  		if input.include?('button')
  			@client.puts "Push which button?"
  			return true
  		end
  		@client.puts "I don't think I can press that..."
  	end
  end

  def say(input)
  	if @guard == true || input.include?('guard') || input.include?('security')
  		@client.puts Image.guard_wave
  		@client.puts
  		@client.puts "You try to be friendly, but the guard simply smiles and waves."
  	else
  		@client.puts "Who are you talking to?"
  	end
  end

  def wave(input)
  	if @guard == true || input.include?('guard') || input.include?('security')
  		@client.puts Image.guard_wave
  		@client.puts
  		@client.puts "Without taking his eyes off the TV the guard smiles and waves back."
  	else
  		@client.puts "You wave your arms in the air like a madperson."
  	end
  end

  def exit(input)
  	if @elevator == true
  		@client.puts "You exit the elevator."
  		go_lobby
  		return true
  	elsif @guard == true
  		@client.puts "You walk away from the guard."
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
  	@client.puts Image.car
  	@client.puts
  	@client.puts "You step outside the building and are immediately hit by a car."
  	@client.puts "Guess going home before 6 wasn't such a good idea..."
  	gameover
  end

  def wolf_attack(floor)
  	@client.puts Image.wolf_1
  	@client.puts "You press the button for floor #{floor}."
  	@client.puts "As you step out of the elevator you realize that you're in the wrong place, this isn't DBC!"
  	@client.puts "You turn around to step back into the elevator, but it's too late."
  	@client.puts "You are eaten by wolves."
  	gameover
  end

  def go_lobby
  	if @guard == false && @elevator == false
  		@client.puts "You begin walking in circles."
  		return true
  	end
  	@client.puts "You step back into the lobby."
  	@description  = "You are standing in the lobby of an office building. To your left is a security guard watching TV. In front of you is a row of elevators. Behind you is the door leading out of the building."
  	@elevator = false
  	@guard = false
  	@view = Image.lobby
  end

  def go_guard
  	if @guard == true
  		@client.puts "You bump into the guard, who shows no sign of caring."
  		return true
  	end
  	@client.puts "You approach the guard."
  	@description = "The guard is watching TV. He hardly seems to notice you."
  	@guard = true
  	@elevator = false
  	@view = Image.guard
  end

  def go_elevator
	if @elevator == true
		@client.puts "You are already in the elevator, silly."
		return true
	end
	@client.puts "You enter the elevator."
	@description = "You are standing in an elevator. There are buttons numbered from 1-7."
	@elevator = true
	@guard = false
	@view = Image.elevator
  end

end
