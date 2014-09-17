describe 'populating the bears table' do 
  before do
    @db = SQLite3::Database.new(':memory:')
    @sql_runner = SQLRunner.new(@db)
    @sql_runner.execute_create_file
    @sql_runner.execute_insert_file
  end

  it 'has 16 bears' do 
    expect(@db.execute("SELECT COUNT(*) FROM bears;").flatten[0]).to eq(16)
  end
end