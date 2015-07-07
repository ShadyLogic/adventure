require 'pathname'
require 'active_record'
require 'faker'
require 'socket'
require_relative 'controller/controller'
require_relative 'model/room'
require_relative 'model/lobby'
require_relative 'model/ascii/image'

#Determines where this file is in relation to the root directory.
path_to_root_directory = File.expand_path('../', __FILE__)
APP_ROOT = Pathname.new(path_to_root_directory)

#Defines location of rooms
model_files = Dir[APP_ROOT.join('model', 'rooms', '*.rb')]



server = TCPServer.new 5000

loop do

  ROOMS = []

  #Searches the model/rooms directory and loads a new instance of each room.
  model_files.each do |model_file|
    require model_file
    filename = File.basename(model_file, ".*")
    class_name = ActiveSupport::Inflector.camelize(filename), model_file
    room = Object::const_get(class_name.first).new
    ROOMS << room
  end

  Thread.start(server.accept) do |client|
    controller = Controller.new(ROOMS)
    # client.system('clear')
    controller.run(client, server)
  end
end
