lib_path = File.expand_path("../../lib", __FILE__)
Dir["#{lib_path}/**/*.rb"].each { |f| require f }

require "byebug"
