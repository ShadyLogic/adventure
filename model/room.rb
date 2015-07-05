
class Room

  def initialize
    @solved = false
    @name         = "Room"
    @description  = "A pretty generic looking room. Somebody got lazy."
    @view         = Image.default
  end

  def look(input=nil)
    puts @view
    puts
    puts @description
  end

  def startup(input=nil)
    look(nil)
  end

  def solved?(input=nil)
    @solved
  end

  def name(input=nil)
    @name
  end

  def description(input=nil)
    @description
  end

  def view(input=nil)
    @view
  end

  private

  def solve
    @solved = true
  end

  def gameover
    puts; puts 'GAME OVER'; puts; abort
  end

end
