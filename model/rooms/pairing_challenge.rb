class PairingChallenge < Room

  def initialize
    super
    @name         = "Lobby"
    @description  = "You are standing in the lobby of an office building. To your left is a security guard. In front of you is a row of elevators. Behind you is the door leading out of the building."
    @view 		  = Image.default
    @elevator 	  = false
    @guard		  = false
  end

end
