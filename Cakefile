require "pg"
require "migrate"

require "onyx"
require "onyx/db"

desc "Migrate database to the latest version"
task :dbmigrate do
  migrator = Migrate::Migrator.new(
    Onyx.db,
    Onyx.logger
  )

  migrator.to_latest
end

desc "Reset database to zero and then to the latest version"
task :dbredo do
  migrator = Migrate::Migrator.new(
    Onyx.db,
    Onyx.logger
  )

  migrator.redo
end
