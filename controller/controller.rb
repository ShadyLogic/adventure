
class Controller

  def initialize

  end

  def run

  end

  def possible_responses(arguments)
    arguments[:options] + arguments[:secret_options] + ['cancel']
  end

  def additional_response(arguments)
    view.puts(arguments[:promt])
    input = nil
    possible_responses
    while !possible_responses(arguments).include?(input)
      input = view.get_input
    end
    return input
  end

end

argument = {prompt: "Which one do you need", options: ["left", "right"], secret_options: ["up"] }
