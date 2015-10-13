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

  def execute_encoded_data
    encoded_data = "SU5TRVJUIElOVE8gYmVhcnMgKGlkLCBuYW1lLCBhZ2UsIGdlbmRlciwgY29s\nb3IsIHRlbXBlcmFtZW50LCBhbGl2ZSkgVkFMVUVTCigxLCJNci4gQ2hvY29s\nYXRlIiwgMjAsICJNIiwgImRhcmsgYnJvd24iLCAiY2FsbSIsIDApLAooMiwi\nUm93ZHkiLCAxMCwgIk0iLCAiYmxhY2siLCAiaW50ZW5zZSIsIDEpLAooMywi\nVGFiaXRoYSIsIDYsICJGIiwgImRhcmsgYnJvd24iLCAiTmljZSIsIDEpLAoo\nNCwiU2FyZ2VhbnQgQnJvd24iLCAxOSwgIk0iLCAiR3JlZW4iLCAiU2xpbXki\nLCAwKSwKKDUsIk1lbGlzc2EiLCAxMywgIkYiLCAiZGFyayBicm93biIsICJn\nb29meSIsIDEpLAooNiwiR3JpbmNoIiwgMiwgIk0iLCAiQmxhY2siLCAiR3Jp\nbmNoeSIsIDEpLAooNywiV2VuZHkiLCA2LCAiRiIsICJCbHVlIiwgIm5haXZl\nIiwgMSksCig4LG51bGwsIDIwLCAiTSIsICJibGFjayIsICJhZ2dyZXNzaXZl\nIiwgMCk7Cg==\n"

    decoded_data = Base64.decode64(encoded_data)
    sql = File.open('lib/decoded_data.sql', 'w'){ |f| f.write (decoded_data) }
    sql = File.read('lib/decoded_data.sql')
    @db.execute_batch(sql)
  end
end
