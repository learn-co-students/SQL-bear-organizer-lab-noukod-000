---
tags: sql, introductory, select, insert, create
languages: sql
resources: 1
---

# SQL Bear Organizer

[Timothy Treadwell](http://en.wikipedia.org/wiki/Timothy_Treadwell) has a lot on his plate protecting the bears of the Katmai National Park in Alaska. Help him keep track of all of his bear friends using SQL.

![timothy-treadwell](http://m2.paperblog.com/i/74/746121/lagghiacciante-morte-delluomo-grizzly-sbranat-L-rr7aep.jpeg)

## Objectives

1. Become familiar with creating tables with columns of various datatypes
2. Learn to write complex and useful select queries

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
│   ├── decoded_data.sql # this file we're using to run the tests
│   └── insert.sql # where you insert your data
└── spec # all your specs
    ├── create_spec.rb
    ├── insert_spec.rb
    ├── select_spec.rb
    └── spec_helper.rb
```

### A Note on Testing

In the `select_spec.rb` spec, the select statements you write are being queried on the table you create in `create.sql`, but **not** on the data you've inserted via `insert.sql`. Instead it's on our own inserted data that's been encoded behind the scenes. 

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
|name   |text   |
|age    |integer|
|gender |char(1)(The choices would be "M" or "F")|
|color  |text   |
|temperment|text|
|alive  |boolean|

Read about [SQLite3 Datatypes](https://www.sqlite.org/datatype3.html) to determine what your insert values are going to be. Be sure to pay attention to how booleans are expressed in SQLite3.

## Part 2: `INSERT`

Input the following 16 bears (you can make up details about them):

* Mr. Chocolate 
* Rowdy 
* Downey 
* Tabitha 
* Sergeant Brown
* Melissa 
* Grinch
* Wendy
* Saturn
* Booble
* Ed 
* Olie 
* Mickey
* Freckles 
* Quincy 
* unnamed (the bear that killed Tim didn't have a name; look up how to create a record that doesn't have one value)

## Part 3: `SELECT`

Get the tests in `spec/select_spec.rb` to pass. Note that for this section, the database will be seeded with external data so don't expect it to reflect the data you added above. Change the specs themselves (where there are empty quotes) to include your querying statements.

## Resources

[SQL Datatypes](http://www.w3schools.com/sql/sql_datatypes_general.asp)
