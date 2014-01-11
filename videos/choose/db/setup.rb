require 'pg'
require "active_record"
require "yaml"

connection_details = YAML::load(File.open('config/database.yml'))

ActiveRecord::Base.establish_connection(connection_details.merge({'database' => "postgres", 'schema_search_path' => 'public'}))

ActiveRecord::Base.connection.drop_database(connection_details.fetch('database')) rescue nil
ActiveRecord::Base.connection.create_database(connection_details.fetch('database')) rescue nil

ActiveRecord::Base.establish_connection(connection_details)

ActiveRecord::Migrator.migrate("db/migrate/")