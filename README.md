---
tags: sql, introductory, select, insert, create
languages: sql
resources: 1
---

# SQL Bear Organizer

[Timothy Treadwell](http://en.wikipedia.org/wiki/Timothy_Treadwell) has a lot on his plate protecting the bears of the Katmai National Park in Alaska. Help him keep track of all of his bear friends using SQL.

![timothy-treadwell](http://www.amissingamerica.com/wp-content/uploads/2012/04/tim_treadwell_large.jpg)

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

Use this resource on [SQL Datatypes](http://www.w3schools.com/sql/sql_datatypes_general.asp) to determine the datatypes of each column.

## Part 2: `INSERT`

Input the following 15 bears (you can make up details about them):

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

## Part 3: `SELECT`

Get the tests in `spec/querying_spec.rb` to pass. Note that for this section, the database will be seeded with external data so don't expect it to reflect the data you added above.

## Resources

[SQL Datatypes](http://www.w3schools.com/sql/sql_datatypes_general.asp)