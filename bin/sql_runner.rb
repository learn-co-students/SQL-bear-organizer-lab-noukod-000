require_relative 'environment'
require 'pry'

class SQLRunner
  def initialize(db)
    @db = db
  end

  def execute_create_file
    sql = File.read("lib/create.sql")
    @db.execute_batch(sql)
  end

  def execute_insert_file
    sql = File.read("lib/insert.sql")
    @db.execute_batch(sql)
  end

  def execute_select_file
    sql = File.read("lib/select.sql")
    @db.execute_batch(sql)
  end

  def execute_data
    sql = File.read('lib/seed.sql')
    @db.execute_batch(sql)
  end
end
