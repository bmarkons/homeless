require "sequel"

DB = Sequel.connect(ENV.fetch("HOMELESS_POSTGRES_URL"))

class Flat < Sequel::Model
end


