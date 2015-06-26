
class Player

  def initialize

  end

end










class Controller

  def init

  end

  def additional_response(argument)
    view.puts(argument[:promt])
    input = nil
    while !arguments[:options].include?(input) || secret_options || 'cancel'
      input = view.get_input
    end
    return input
  end

end

argument = {prompt: "Which one do you need", options: ["left", "right"], secret_options: ["up"] }
