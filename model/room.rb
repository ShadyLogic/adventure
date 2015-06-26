
class Room

  def initialize(player)
    @name               = args.fetch(:name, "A Room")
    @enter_text         = args.fetch(:exit_text, "You enter a room. It looks very generic.")
    @exit_text          = args.fetch(:exit_text, "You enter a room. It looks very generic.")
    @description        = args.fetch(:description, "You are standing in a room. There's not much to it. What a boring place.")
    @solved             = false

    @player = player
  end

  def solved?
    @solved
  end

  def solve
    @solved = true
  end

  def look
    @description
  end

end
