def selects_all_female_bears_return_name_and_age
  "select name, age from bears where gender ='F' "
end

def selects_all_bears_names_and_orders_in_alphabetical_order
  "SELECT name from bears ORDER BY name ASC"
end

def selects_all_bears_names_and_ages_that_are_alive_and_order_youngest_to_oldest
  "SELECT name, age FROM bears WHERE alive = 1 ORDER BY age ASC"
end

def selects_oldest_bear_and_returns_name_and_age
  "select name as name, max(age) as age from bears"
end

def select_youngest_bear_and_returns_name_and_age
  "select name as name, min(age) as age from bears"
end

def selects_most_prominent_color_and_returns_with_count
  "SELECT color, COUNT(color) FROM bears GROUP BY color ORDER BY COUNT(*) DESC LIMIT 1;"
end

def counts_number_of_bears_with_goofy_temperaments
  "select count(*) from bears where temperament = 'goofy' "
end

def selects_bear_that_killed_Tim
  "select id, name, age, gender, color, temperament, alive from bears where temperament ='aggressive' "
end
