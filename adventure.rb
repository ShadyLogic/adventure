require 'pathname'
require 'active_record'
require 'faker'
require_relative 'controller/controller'
require_relative 'model/room'
require_relative 'model/lobby'
require_relative 'model/ascii/image'

#Determines where this file is in relation to the root directory.
path_to_root_directory = File.expand_path('../', __FILE__)
APP_ROOT = Pathname.new(path_to_root_directory)

#Defines location of rooms
model_files = Dir[APP_ROOT.join('model', 'rooms', '*.rb')]

ROOMS = []

#Searches the model/rooms directory and loads a new instance of each room.
model_files.each do |model_file|
  require model_file
  filename = File.basename(model_file, ".*")
  class_name = ActiveSupport::Inflector.camelize(filename), model_file
  room = Object::const_get(class_name.first).new
  ROOMS << room
end

controller = Controller.new(ROOMS)

system('clear')

controller.run