# SQL Bear Organizer

[Timothy Treadwell](http://en.wikipedia.org/wiki/Timothy_Treadwell) has a lot on his plate protecting the bears of the Katmai National Park in Alaska. Help him keep track of all of his bear friends using SQL.

![timothy-treadwell](http://m2.paperblog.com/i/74/746121/lagghiacciante-morte-delluomo-grizzly-sbranat-L-rr7aep.jpeg)

## Objectives

1. Use the `CREATE TABLE` command to create a new table with various data types
2. Use the `INSERT INTO` command to insert data (i.e. rows) into a database table
3. Use the `SELECT` command with various functions and modifiers to write queries

## Lab Structure

This lab might seem a bit different than what you've seen before. Take a look at the file structure:

```bash
├── Gemfile
├── README.md
├── bin
│   ├── environment.rb # requires bundler and files
│   ├── run.rb # instantiates the SQLRunner class in the below file
│   └── sql_runner.rb # holds a class that handles executing your .sql files
├── lib
│   ├── create.sql # where you create your schema
│   └── insert.sql # where you insert your data
│   └── seed.sql # data for in-memory database
│   └── sql_queries.rb # where you write your sql queries
└── spec # all the specs
    ├── create_spec.rb # this tests your create.sql file
    ├── insert_spec.rb # this tests your insert.sql file
    ├── select_spec.rb # this tests the queries you write in this file
    └── spec_helper.rb
```

### A Note on Testing

Let's briefly go over what is happening in the `before` block that our tests will be using.

```ruby
before do
  @db = SQLite3::Database.new(':memory:')
  @sql_runner = SQLRunner.new(@db)
  @sql_runner.execute_create_file
end
```
Before each test two important things happen.

First, a new in-memory database is created. Why do we do this? Let's say we run our tests and they add ten items to our database. If we did not use an in-memory store, those would be in there forever. This way our database gets thrown out after every running of the tests. You can learn more about in-memory databases [here](https://www.sqlite.org/inmemorydb.html).

Next, a new `SqlRunner` class is created. The `SqlRunner` class lives in your `bin` directory and was created to help connect to the database.

## Part 1: `CREATE TABLE`

Get the tests in `spec/create_spec.rb` to pass. Your `CREATE` statement should look something like this:

```sql
CREATE TABLE bears (
  //columns here
);
```

Your columns should be the following types:

|column | type  |
|-------|-------|
|id     |integer| <-- Make sure this is the table's primary key
|name   |text   |
|age    |integer|
|gender |char(1)(The choices would be "M" or "F")|
|color  |text   |
|temperament|text|
|alive  |boolean|

Read about [SQLite3 Datatypes](https://www.sqlite.org/datatype3.html) to determine what your insert values are going to be. Be sure to pay attention to how booleans are expressed in SQLite3.

## Part 2: `INSERT`

Get the tests in `spec/insert_spec.rb` to pass. Input the following 8 bears (you can make up details about them):

* Mr. Chocolate
* Rowdy
* Tabitha
* Sergeant Brown
* Melissa
* Grinch
* Wendy
* unnamed (the bear that killed Tim didn't have a name; refer back to how to create a record that doesn't have one value)

## Part 3: `SELECT`

Get the tests in `spec/select_spec.rb` to pass. Note that for this section, the database will be seeded with external data from the `lib/seed.sql` file so don't expect it to reflect the data you added above. Note: Since it's a Ruby file, write your queries as strings in the `lib/sql_queries.rb`.

You may be expected to use SQL statements that you're not particularly familiar with. Make sure you use the resources and Google to find the right statements.

## Resources

[SQL Datatypes](https://www.sqlite.org/datatype3.html)
[SQL GROUP BY](https://www.sqlite.org/lang_select.html#resultset)

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/SQL-bear-organizer-lab' title='SQL Bear Organizer'>SQL Bear Organizer</a> on Learn.co and start learning to code for free.</p>
