
class Model
  attr_accessor :rooms

  def initialize
    @rooms = []
    @current_room = nil
  end

  def add_room_to_queue(room)
    rooms << room
  end

  def load_room
    current_room = rooms.shuffle.pop
  end

end
