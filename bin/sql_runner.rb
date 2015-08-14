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
    encoded_data = "SU5TRVJUIElOVE8gYmVhcnMgKGlkLCBuYW1lLCBhZ2UsIGdlbmRlciwgY29s\nb3IsIHRlbXBlcmFtZW50LCBhbGl2ZSkgVkFMVUVTCigxLCJNci4gQ2hvY29s\nYXRlIiwgMjAsICJNIiwgImRhcmsgYnJvd24iLCAiY2FsbSIsICJGQUxTRSIp\nLAooMiwiUm93ZHkiLCAxMCwgIk0iLCAiYmxhY2siLCAiaW50ZW5zZSIsICJU\nUlVFIiksCigzLCJUYWJpdGhhIiwgNiwgIkYiLCAiZGFyayBicm93biIsICJO\naWNlIiwgIlRSVUUiKSwKKDQsIlNhcmdlYW50IEJyb3duIiwgMTksICJNIiwg\nIkdyZWVuIiwgIlNsaW15IiwgIkZBTFNFIiksCig1LCJNZWxpc3NhIiwgMTMs\nICJGIiwgImRhcmsgYnJvd24iLCAiZ29vZnkiLCAiVFJVRSIpLAooNiwiR3Jp\nbmNoIiwgMiwgIk0iLCAiQmxhY2siLCAiR3JpbmNoeSIsICJUUlVFIiksCig3\nLCJXZW5keSIsIDYsICJGIiwgIkJsdWUiLCAibmFpdmUiLCAiVFJVRSIpLAoo\nOCxudWxsLCAyMCwgIk0iLCAiYmxhY2siLCAiYWdncmVzc2l2ZSIsICJGQUxT\nRSIpOwo=\n"

    decoded_data = Base64.decode64(encoded_data)
    sql = File.open('lib/decoded_data.sql', 'w'){ |f| f.write (decoded_data) }
    sql = File.read('lib/decoded_data.sql')
    @db.execute_batch(sql)
  end
end
