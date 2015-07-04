
class Room
  attr_reader :name, :enter_text, :exit_text, :description

  def initialize
    @solved = false
    @name         = "Room"
    @enter_text   = "You are standing in a room."
    @exit_text    = "You leave the room."
    @description  = "A pretty generic looking room. Somebody got lazy."
  end

  def solved?
    @solved
  end

  private

  def solve
    @solved = true
  end

end
