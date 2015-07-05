
class Room

  def initialize
    @solved = false
    @name         = "Room"
    @creator      = "Jacob Rogers"
    @description  = "A pretty generic looking room, almost looks half finished."
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

  def creator(input=nil)
    puts "This room was created by #{@creator}."
  end

  private

  def solve
    @solved = true
  end

  def gameover
    puts; puts 'GAME OVER'; puts; abort
  end

end
