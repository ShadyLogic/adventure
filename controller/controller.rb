class Controller

  def initialize

  end

  def run

  end

  def possible_responses(arguments)
    argument[:options] + arguments[:secret_options] + ['cancel']
  end

  def additional_response(arguments)
    view.puts(argument[:promt])
    input = nil
    possible_responses
    while !arguments[:options].include?(input) || secret_options || 'cancel'
      input = view.get_input
    end
    return input
  end

end

argument = {prompt: "Which one do you need", options: ["left", "right"], secret_options: ["up"] }
