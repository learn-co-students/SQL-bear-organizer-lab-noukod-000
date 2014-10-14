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
|gender |char(1)|
|color  |text   |
|temperment|text|
|alive  |boolean|

Check out this resource on [SQL Datatypes](http://www.w3schools.com/sql/sql_datatypes_general.asp) to learn more about datatypes.

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
