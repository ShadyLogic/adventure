
class Controller
  attr_accessor :rooms, :current_room, :view

  def initialize(model_files)
    @player = Player.new
    @rooms = []
    load_rooms(model_files)
    @current_room = Lobby.new
    @view = View.new
  end

  def run
    enter_room
    while !current_room.solved?
      parse_input(get_input)
    end
    puts current_room.exit_text
    @current_room = rooms.shuffle.pop
    run
  end


  private


  def get_input
    print '?> '
    gets.chomp.downcase
  end


  def add_room(room)
    rooms << room
  end

  #Searches the model/rooms directory and loads a new instance of each room.
  def load_rooms(model_files)
    model_files.each do |model_file|
      require model_file
      filename = File.basename(model_file, ".*")
      class_name = ActiveSupport::Inflector.camelize(filename), model_file
      room = Object::const_get(class_name.first).new
      add_room(room)
    end
  end

  def enter_room
    puts current_room.enter_text
  end

  def parse_input(input)
    puts
    input = input.split
    return true if core_commands(input)
    return true if room_commands(input)
    unknown_command
  end

  def core_commands(input)
    if input.include?('look')
      puts current_room.description 
      return true
    end
  end

  def room_commands(input)
    input.each do |command|
      if current_room.respond_to?(command)
        current_room.send(command, input)
        return true
      end
    end
    return false
  end

  def unknown_command
    responses = ["I don't understand", "Huh?", "lolwut?", "What?", "Pardon?", "Excuse me?", "Come again?", "Wha..?"]
    puts responses.sample
  end

end
