require_relative 'environment'

class SQLRunner
  def initialize(db)
    @db = db
  end

  def execute_create_file
    sql = File.read("lib/create.sql")
    execute_sql(sql)
  end

  def execute_insert_file
    sql = File.read("lib/insert.sql")
    execute_sql(sql)
  end

  def execute_select_file
    sql = File.read("lib/select.sql")
    execute_sql(sql)
  end

  def execute_encoded_data

    encoded_data = "SU5TRVJUIElOVE8gYmVhcnMgKGlkLCBuYW1lLCBhZ2UsIGdlbmRlciwgY29s\nb3IsIHRlbXBlcm1lbnQsIGFsaXZlKSBWQUxVRVMgCigxLCAiTXIuIENob2Nv\nbGF0ZSIsIDIwLCAiTSIsICJjaG9jb2xhdGUgYnJvd24iLCAiZ29vZnkiLCAx\nKSwgCigyLCAiUm93ZHkiLCAxMCwgIk0iLCAibGlnaHQgYnJvd24iLCAicm93\nZHkiLCAxKSwgCigzLCAiRG93bmV5IiwgMTIsICJGIiwgImJlaWdlIiwgImdl\nbnRsZSIsIDEpLCAKKDQsICJUYWJpdGhhIiwgMTgsICJGIiwgImRhcmsgYnJv\nd24iLCAiZ29vZnkiLCAwKSwgCig1LCAiU2VyZ2VhbnQgQnJvd24iLCAxOSwg\nIk0iLCAiZGFyayBicm93biIsICJkb21pbmFudCIsIDEpLCAKKDYsICJNZWxp\nc3NhIiwgMTMsICJGIiwgImxpZ2h0IGJyb3duIiwgInRlcnJpdG9yaWFsIiwg\nMSksIAooNywgIkdyaW5jaCIsIDIsICJNIiwgImNob2NvbGF0ZSBicm93biIs\nICJhZ3Jlc3NpdmUiLCAxKSwgCig4LCAiV2VuZHkiLCAyMywgIkYiLCAiYmVp\nZ2UiLCAiZ2VudGxlIiwgMCksIAooOSwgIlNhdHVybiIsIDI1LCAiTSIsICJh\ndWJ1cm4iLCAicm93ZHkiLCAwKSwgCigxMCwgIkJvb2JsZSIsIDksICJNIiwg\nImJlaWdlIiwgImdvb2Z5IiwgMSksIAooMTEsICJFZCIsIDgsICJNIiwgImRh\ncmsgYnJvd24iLCAiZ2VudGxlIiwgMSksIAooMTIsICJPbGllIiwgMTYsICJN\nIiwgImxpZ2h0IGJyb3duIiwgImdvb2Z5IiwgMSksIAooMTMsICJNaWNrZXki\nLCAxMCwgIk0iLCAiZGFyayBicm93biIsICJkb21pbmFudCIsIDEpLCAKKDE0\nLCAiRnJlY2tsZXMiLCA1LCAiTSIsICJkYXJrIGJyb3duIiwgInRlcnJpdG9y\naWFsIiwgMCksIAooMTUsICJRdWluY3kiLCAyNiwgIk0iLCAiYXVidXJuIiwg\nImdlbnRsZSIsIDEpLAooMTYsIE5VTEwsIDIwLCAiTSIsICJkYXJrIGJyb3du\nIiwgImFncmVzc2l2ZSIsIDApOw==\n"
    decoded_data = Base64.decode64(encoded_data)
    sql = File.open('lib/decoded_data.sql', 'w'){ |f| f.write (decoded_data) }
    sql = File.read('lib/decoded_data.sql')
    execute_sql(sql)
  end

  def execute_sql(sql)
     sql.scan(/[^;]*;/m).each { |line| @db.execute(line) } unless sql.empty?
  end
end