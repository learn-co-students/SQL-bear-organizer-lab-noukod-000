describe 'creating bears table' do 
  before do
    @db = SQLite3::Database.new(':memory:')
    @sql_runner = SQLRunner.new(@db)
    @sql_runner.execute_create_file
  end

  it "creates a bears table with a name field" do
    expect{@db.execute("SELECT name FROM bears;")}.to_not raise_exception
  end

  it "creates a bears table with an age field" do
    expect{@db.execute("SELECT age FROM bears;")}.to_not raise_exception
  end

  it "creates a bears table with a color field" do
    expect{@db.execute("SELECT color FROM bears;")}.to_not raise_exception
  end

  it "creates a bears table with a temperment field" do
    expect{@db.execute("SELECT temperment FROM bears;")}.to_not raise_exception
  end

  it "creates a bears table with an alive field" do
    expect{@db.execute("SELECT alive FROM bears;")}.to_not raise_exception
  end

  it "creates a bears table with a birthday field" do
    expect{@db.execute("SELECT birthday FROM bears;")}.to_not raise_exception
  end

  it "creates a bears table with an id as a primary key" do
    expect(@db.execute("PRAGMA table_info(bears);").detect { |arr| arr[-1] == 1 && arr[2] == "INTEGER" }.length).to eq(6)
  end
end