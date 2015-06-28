require 'pathname'
require 'active_record'
require_relative 'model/room'

path_to_root_directory = File.expand_path('../', __FILE__)
APP_ROOT = Pathname.new(path_to_root_directory)

model_files = Dir[APP_ROOT.join('model', 'rooms', '*.rb')]

model_files.each do |model_file|
  require model_file

  filename = File.basename(model_file, ".*")

  class_name = ActiveSupport::Inflector.camelize(filename), model_file

  puts class_name
end

