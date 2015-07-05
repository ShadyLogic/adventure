
class Controller
  attr_accessor :rooms, :current_room, :view

  def initialize(rooms)
    @rooms = rooms
    @current_room = Lobby.new
  end

  def run
    current_room.startup
    while !current_room.solved?
      parse_input(get_input)
    end
    unless @rooms.empty?
      @current_room = rooms.shuffle!.pop
      run
    end
  end

#####################################################
  private

  def get_input
    print '?> '
    gets.chomp.downcase
  end

  def parse_input(input)
    puts
    input = input.split
    return true if core_commands(input)
    return true if room_commands(input)
    unknown_command
  end

  def core_commands(input)
    if input.include?('clear')
        system('clear')
        puts current_room.description
      return true
    end
    if input.include?('quit')
        abort
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
