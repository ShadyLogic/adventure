
class Room

  def initialize
    @client = nil
    @solved = false
    @name         = "Room"
    @creator      = "unknown"
    @description  = "A pretty generic looking room, almost looks half finished."
    @view         = Image.default
    @fail         = false
  end

  def get_client(client)
    @client = client
  end

  def look(input=nil)
    @client.puts @view
    @client.puts
    @client.puts @description
  end

  def startup(input=nil)
    look(nil)
  end

  def solved?(input=nil)
    @solved
  end

  def fail?
    @fail
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
    @client.puts "This room was created by #{@creator}."
  end

  private

  def solve
    @solved = true
  end

  def gameover
    @client.puts; @client.puts 'GAME OVER'; @client.puts; @fail = true
  end

end
