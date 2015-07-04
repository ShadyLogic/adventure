require 'pathname'
require 'active_record'
require_relative 'model/player'
require_relative 'model/room'
require_relative 'controller/controller'
require_relative 'model/lobby'
require_relative 'view/view'

path_to_root_directory = File.expand_path('../', __FILE__)
APP_ROOT = Pathname.new(path_to_root_directory)

model_files = Dir[APP_ROOT.join('model', 'rooms', '*.rb')]

controller = Controller.new(model_files)

system('clear')

controller.run