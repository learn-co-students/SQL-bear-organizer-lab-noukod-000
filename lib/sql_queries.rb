def selects_all_female_bears_return_name_and_age
  "SELECT name, age FROM bears WHERE gender = 'F';"
end

def selects_all_bears_names_and_orders_in_alphabetical_order
  "SELECT name FROM bears order by name asc;"
end

def selects_all_bears_names_and_ages_that_are_alive_and_order_youngest_to_oldest
  "SELECT name, age FROM bears WHERE alive = 1 Order by age asc;"
end

def selects_oldest_bear_and_returns_name_and_age
  "SELECT name, Max(age) FROM bears;"
end

def select_youngest_bear_and_returns_name_and_age
  "SELECT name, Min(age) FROM bears;"
end

def selects_most_prominent_color_and_returns_with_count
  "SELECT color, Max(countC) FROM (SELECT color, count(*) as countC FROM bears Group by color);"
end

def counts_number_of_bears_with_goofy_temperaments
  "SELECT count(*) FROM bears WHERE temperament = 'goofy';"

end

def selects_bear_that_killed_Tim
  "SELECT * FROM bears WHERE name is NULL;"
end
