
class View

  def display(string)
    puts string
  end

  def get_input
  	print '?> '
    gets.chomp.downcase
  end

end
