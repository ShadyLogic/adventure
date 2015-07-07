class Lodge < Room

  def initialize
    super
    @name         	= "Lodge"
    @creator		=	"Jacob Rogers"
    @description	= "You are standing in the Lodge, a large room filled with empty chairs and a ping pong table. Standing next to the table is a student from Phase 2."
    @view 		  	= Image.ping_pong_1
    @student	  	= Person.new
    @pong_game		= PongGame.new(@student)
  end

  def startup(input=nil)
  	@client.puts "You walk past the kitchen into the Lodge you hear the sound of a ping pong ball being bounced on a paddle."
    look(nil)
  end

  def say(input)
  	if input.include?('student')
  		@client.puts @student.face
  		@client.puts
  		@student.talk
  	elsif input.include?('chair')
  		@client.puts "The chair smiles and winks."
  	else
  		@client.puts "Who are you talking to?"
  	end
  end

  def play(input)
  	if input.include?('pong') || input.include?('pingpong')
  		@pong_game = PongGame.new(@student)
  		solve if @pong_game.play
  	elsif input.include?('chair')
  		@client.puts "You play with the chair. Weirdo."
  	else
  		@client.puts "Did you want to play ping pong?"
  	end
  end

  def crush(input)
  	if input.include?('ball')
  		@client.puts "You crush the ping pong ball. It is now impossible to play. You monster."
  		sleep(1)
  		solve
  	elsif input.include?('student')
  		@client.puts "The student smiles at you and mouths the words \"Bring it on\"."
  	elsif input.include?('chair')
  		@client.puts "You destroy one of the chairs. Good job?"
  	else
  		@client.puts "My, aren't we violent."
  	end
  end

  def talk(input)
  	say(input)
  end

  def destroy(input)
  	crush(input)
  end

  def step(input)
  	crush(input)
  end

  def break(input)
  	input << 'ball' if input.include?('pong')
  	crush(input)
  end

end

class PongGame
	attr_accessor :player_score, :student_score

	def initialize(student)
		@player_score 	= 0
		@student_score 	= 0
		@student 		= student
	end

	def play
		while (player_score < 7 && student_score < 7) || overtime?
			determine_serve
		end
		@client.puts
		@client.puts "The final score was:"
		@client.puts "You: #{player_score} | #{@student.name}: #{student_score}"
		if player_score > student_score
			player_wins
			return true
		else
			student_wins
			return false
		end
	end

#################################################
	private


	def overtime?
		if player_score >= 7 || student_score >= 7
			return true if (student_score - player_score).abs < 2
		end
		false
	end

	def determine_serve
		@client.puts
		@client.puts Image.ping_pong_2
		@client.puts
		@client.puts "The score is You: #{player_score}, #{@student.name.split(" ").first}: #{student_score}"
		sleep(1.5)
		if overtime?
			@client.puts
			@client.puts "You have to win by two! Overtime!"
			sleep(1)
			if student_score - player_score > 0
				player_serve
				return
			elsif student_score - player_score < 0
				student_serve
				return
			end
		end
		if (student_score + player_score).even?
			student_serve
		else
			player_serve
		end
	end

	def player_serve
		@client.puts
		@client.puts "It's your turn to serve."
		input = gets.chomp.downcase
		until input == "serve"
			@client.puts
			@client.puts "*sigh*, just type 'serve'"
			input = gets.chomp.downcase
		end
		@client.puts
		@client.puts "You serve the ball to #{@student.name}"
		sleep(1)
		student_turn
	end

	def student_serve
		@client.puts
		@client.puts "#{@student.name} serves the ball."
		sleep(1)
		player_turn
	end

	def student_turn
		@client.puts
		if (rand*10).to_i.even?
			@client.puts "#{@student.name.split(" ").first} returns the ball!"
			sleep(1)
			player_turn
		else
			@client.puts "SCORE! #{@student.name.split(" ").first} was unable to stop the ball!"
			sleep(1)
			@player_score += 1
		end
	end

	def player_turn
		@client.puts
		@client.puts "The ball travels over the net, do you want to aim high or low?"
		input = gets.chomp.downcase
		until input == "high" || input == "low" || input == "smash cannady"
			@client.puts
			@client.puts "Please type 'high' or 'low'."
			input = gets.chomp.downcase
		end
		@client.puts
		if input == 'smash cannady'
			@client.puts "You channel the spirit of Tim Cannady and smash the heck out of the ball! SCORE!"
			sleep(1)
			@player_score += 1
			return
		end
		if (rand*10).to_i.even?
			@client.puts "You aim #{input} and slam the ball back at #{@student.name.split(" ").first}!"
			sleep(1)
			student_turn
		else
			@client.puts "Oh no! You aimed #{input} but the ball slipped past you."
			sleep(1)
			@student_score += 1
		end
	end

	def player_wins
		@client.puts
		@client.puts "You win! #{@student.name.split(" ").first} @client.puts their paddle down on the table and shakes your hand."
		sleep(1)
		@client.puts
		@client.puts "Satisfied with your victory, you make your way out of the lodge. Back to work!"
		sleep(1)
	end

	def student_wins
		@client.puts
		@client.puts "You lost! #{@student.name.split(" ").first} says \"Better luck next time! Want to play again?\""
	end

end

class Person
	attr_reader :name, :job, :cohort, :face, :body

	def initialize
		@name 	= Faker::Name.name
		@job 	= Faker::Name.title
		verb 	= Faker::Hacker.verb.capitalize
		verb.chop! if verb[-1] == 'e'
		@cohort = "#{Faker::Hacker.verb.capitalize}ing #{Faker::Team.creature.capitalize}"
		@face 	= nil
		@body 	= nil
		get_face_body
		@introduced = false
	end

	def get_face_body
		if (rand*10).to_i.even?
			@face = Image.woman_1_face
			@body = Image.woman_1
		else
			@face = Image.man_1_face
			@body = Image.man_1
		end
	end

	def talk
		unless @introduced
			@client.puts "Hi! My name is #{@name}! I'm a member of the #{@cohort}. Want to play some ping pong?"
			@introduced = true
		else
			@client.puts Faker::Hacker.say_something_smart
		end
	end

end
