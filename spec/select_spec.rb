describe 'querying the bears table' do 
  before do
    @db = SQLite3::Database.new(':memory:')
    @sql_runner = SQLRunner.new(@db)
    @sql_runner.execute_create_file
    @sql_runner.execute_insert_file
    #@sql_runner.execute_encoded_data
  end
  after do
    File.open('lib/decoded_data.sql', 'w'){ |f| f.truncate(0) }
  end

  it 'selects all of the female bears and returns their name and age' do 
    expect(@db.execute('SELECT bears.name, bears.age FROM bears WHERE gender="F";')).to eq([["Downey", 12],["Tabitha", 18],["Melissa", 13], ["Wendy", 23]])
  end

  it 'selects all of the bears names and orders them in alphabetical order' do
    expect(@db.execute("SELECT bears.name FROM bears ORDER BY bears.name ASC;")).to eq([[nil],["Booble"],["Downey"],["Ed"],["Freckles"],["Grinch"],["Melissa"],["Mickey"],["Mr. Chocolate"],["Olie"],["Quincy"],["Rowdy"],["Saturn"],["Sergeant Brown"],["Tabitha"],["Wendy"]])
  end

  it 'selects all of the bears names and ages that are alive and order them from youngest to oldest' do 
    expect(@db.execute('SELECT bears.name, bears.age FROM bears WHERE bears.alive="TRUE" ORDER BY bears.age ASC;')).to eq([
      ["Grinch", 2],["Ed", 8],["Booble", 9],["Rowdy", 10],["Mickey", 10],["Downey", 12],["Melissa", 13],["Olie", 16],["Sergeant Brown", 19],["Mr. Chocolate", 20],["Quincy", 26]])
  end

  it 'selects the oldest bear and returns their name and age' do 
    expect(@db.execute("SELECT bears.name, bears.age FROM bears ORDER BY bears.age DESC LIMIT 1;")).to eq([["Quincy", 26]])
  end

  it 'selects the youngest bear and returns their name and age' do 
    expect(@db.execute("SELECT bears.name, bears.age FROM bears ORDER BY bears.age ASC LIMIT 1")).to eq([["Grinch", 2]])
  end

  it 'selects the most prominant color and returns it with its count' do 
    expect(@db.execute("SELECT bears.color, COUNT(bears.color) FROM bears GROUP BY bears.color ORDER BY COUNT(*) DESC LIMIT 1;")).to eq([["dark brown", 6]])
  end

  it 'counts the number of bears with goofy temperments' do 
    expect(@db.execute('SELECT count(bears.temperment) FROM bears WHERE bears.temperment="goofy";')).to eq([[4]])
  end

  it 'selects the bear that killed Tim' do 
    expect(@db.execute("SELECT * FROM bears WHERE bears.name IS NULL")).to eq([[16, nil, 20, "M", "dark brown", "agressive", "FALSE"]])
  end
end