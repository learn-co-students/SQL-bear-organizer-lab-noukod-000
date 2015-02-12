describe 'querying the bears table' do
  before do
    @db = SQLite3::Database.new(':memory:')
    @sql_runner = SQLRunner.new(@db)
    @sql_runner.execute_create_file
    @sql_runner.execute_encoded_data
  end
  after do
    File.open('lib/decoded_data.sql', 'w'){ |f| f.truncate(0) }
  end

  it 'selects all of the female bears and returns their name and age' do
    expect(@db.execute('SELECT bears.name, bears.age FROM bears WHERE gender="F";')).to eq([["Tabitha", 6],["Melissa", 13], ["Wendy", 6]])
  end

  it 'selects all of the bears names and orders them in alphabetical order' do
    expect(@db.execute("SELECT bears.name FROM bears ORDER BY bears.name ASC;")).to eq([[nil],["Grinch"],["Melissa"],["Mr. Chocolate"],["Rowdy"],["Sargeant Brown"],["Tabitha"],["Wendy"]])
  end

  it 'selects all of the bears names and ages that are alive and order them from youngest to oldest' do
    expect(@db.execute('SELECT bears.name, bears.age FROM bears WHERE alive="TRUE" ORDER BY bears.age ASC;')).to eq([["Grinch", 2], ["Tabitha", 6], ["Wendy", 6], ["Rowdy", 10], ["Melissa", 13]])
  end

  it 'selects the oldest bear and returns their name and age' do
    expect(@db.execute("SELECT bears.name, bears.age FROM bears ORDER BY bears.age DESC LIMIT 1;")).to eq([["Mr. Chocolate", 20]])
  end

  it 'selects the youngest bear and returns their name and age' do
    expect(@db.execute("SELECT bears.name, bears.age FROM bears ORDER BY bears.age ASC LIMIT 1;")).to eq([["Grinch", 2]])
  end

  it 'selects the most prominent color and returns it with its count' do
    expect(@db.execute("SELECT bears.color, COUNT(bears.color) FROM bears GROUP BY bears.color ORDER BY COUNT(*) DESC LIMIT 1;")).to eq([["dark brown", 3]])
  end

  it 'counts the number of bears with goofy temperments' do
    expect(@db.execute('SELECT COUNT(bears.temperament) FROM bears WHERE bears.temperament="goofy";')).to eq([[1]])
  end

  it 'selects the bear that killed Tim' do
    expect(@db.execute("SELECT * FROM bears WHERE bears.name IS NULL;")).to eq([[8, nil, 20, "M", "black", "aggressive", "FALSE"]])
  end
end
