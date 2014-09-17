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

    encoded_data = "SU5TRVJUIElOVE8gYmVhcnMgKGlkLCBuYW1lLCBhZ2UsIGdlbmRlciwgY29s\nb3IsIHRlbXBlcm1lbnQsIGFsaXZlKSBWQUxVRVMgCigxLCAiTXIuIENob2Nv\nbGF0ZSIsIDIwLCAiTSIsICJjaG9jb2xhdGUgYnJvd24iLCAiZ29vZnkiLCAi\nVFJVRSIpLCAKKDIsICJSb3dkeSIsIDEwLCAiTSIsICJsaWdodCBicm93biIs\nICJyb3dkeSIsICJUUlVFIiksIAooMywgIkRvd25leSIsIDEyLCAiRiIsICJi\nZWlnZSIsICJnZW50bGUiLCAiVFJVRSIpLCAKKDQsICJUYWJpdGhhIiwgMTgs\nICJGIiwgImRhcmsgYnJvd24iLCAiZ29vZnkiLCAiRkFMU0UiKSwgCig1LCAi\nU2VyZ2VhbnQgQnJvd24iLCAxOSwgIk0iLCAiZGFyayBicm93biIsICJkb21p\nbmFudCIsICJUUlVFIiksIAooNiwgIk1lbGlzc2EiLCAxMywgIkYiLCAibGln\naHQgYnJvd24iLCAidGVycml0b3JpYWwiLCAiVFJVRSIpLCAKKDcsICJHcmlu\nY2giLCAyLCAiTSIsICJjaG9jb2xhdGUgYnJvd24iLCAiYWdyZXNzaXZlIiwg\nIlRSVUUiKSwgCig4LCAiV2VuZHkiLCAyMywgIkYiLCAiYmVpZ2UiLCAiZ2Vu\ndGxlIiwgIkZBTFNFIiksIAooOSwgIlNhdHVybiIsIDI1LCAiTSIsICJhdWJ1\ncm4iLCAicm93ZHkiLCAiRkFMU0UiKSwgCigxMCwgIkJvb2JsZSIsIDksICJN\nIiwgImJlaWdlIiwgImdvb2Z5IiwgIlRSVUUiKSwgCigxMSwgIkVkIiwgOCwg\nIk0iLCAiZGFyayBicm93biIsICJnZW50bGUiLCAiVFJVRSIpLCAKKDEyLCAi\nT2xpZSIsIDE2LCAiTSIsICJsaWdodCBicm93biIsICJnb29meSIsICJUUlVF\nIiksIAooMTMsICJNaWNrZXkiLCAxMCwgIk0iLCAiZGFyayBicm93biIsICJk\nb21pbmFudCIsICJUUlVFIiksIAooMTQsICJGcmVja2xlcyIsIDUsICJNIiwg\nImRhcmsgYnJvd24iLCAidGVycml0b3JpYWwiLCAiRkFMU0UiKSwgCigxNSwg\nIlF1aW5jeSIsIDI2LCAiTSIsICJhdWJ1cm4iLCAiZ2VudGxlIiwgIlRSVUUi\nKSwKKDE2LCBOVUxMLCAyMCwgIk0iLCAiZGFyayBicm93biIsICJhZ3Jlc3Np\ndmUiLCAiRkFMU0UiKTs=\n"
    decoded_data = Base64.decode64(encoded_data)
    sql = File.open('lib/decoded_data.sql', 'w'){ |f| f.write (decoded_data) }
    sql = File.read('lib/decoded_data.sql')
    execute_sql(sql)
  end

  def execute_sql(sql)
     sql.scan(/[^;]*;/m).each { |line| @db.execute(line) } unless sql.empty?
  end
end