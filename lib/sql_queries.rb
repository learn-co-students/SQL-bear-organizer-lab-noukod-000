def selects_all_female_bears_return_name_and_age 
  "SELECT bears.name, bears.age FROM bears WHERE gender='F';"
end

def selects_all_bears_names_and_orders_in_alphabetical_order 
  "SELECT bears.name FROM bears ORDER BY bears.name ASC;"
end

def selects_all_bears_names_and_ages_that_are_alive_and_order_youngest_to_oldest 
  "SELECT bears.name, bears.age FROM bears WHERE alive=1 ORDER BY bears.age ASC;"
end

def selects_oldest_bear_and_returns_name_and_age 
  "SELECT bears.name, bears.age FROM bears ORDER BY bears.age DESC LIMIT 1;"
end

def select_youngest_bear_and_returns_name_and_age 
  "SELECT bears.name, bears.age FROM bears ORDER BY bears.age ASC LIMIT 1;"
end

def selects_most_prominent_color_and_returns_with_count
  "SELECT bears.color, COUNT(bears.color) FROM bears GROUP BY bears.color ORDER BY COUNT(*) DESC LIMIT 1;"
end

def counts_number_of_bears_with_goofy_temperaments 
  "SELECT COUNT(bears.temperament) FROM bears WHERE bears.temperament='goofy';"
end

def selects_bear_that_killed_Tim 
  "SELECT * FROM bears WHERE bears.name IS NULL;"
end