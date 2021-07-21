def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year
  FROM books
  WHERE series_id = 1
  ORDER BY year"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT characters.name, characters.motto
  FROM characters
  WHERE length(motto) = (SELECT max(length(motto)) FROM characters)"
end


def select_value_and_count_of_most_prolific_species
  "SELECT characters.species, COUNT(characters.species) AS most_prolific_species
  FROM characters
  GROUP BY species 
  ORDER BY most_prolific_species DESC LIMIT 1"
end

def select_name_and_series_subgenres_of_authors
  "SELECT Authors.name, subgenres.name
  FROM Authors
  JOIN Series
  ON Series.author_id = Authors.id
  JOIN subgenres
  ON Series.subgenre_id = subgenres.id"
end

def select_series_title_with_most_human_characters
  "SELECT Series.title
  FROM Series
  JOIN characters
  ON characters.author_id = Series.author_id
  WHERE characters.species = 'human'
  GROUP BY title
  ORDER BY COUNT(species) DESC LIMIT 1"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(*) AS number_of_books
  FROM characters
  LEFT OUTER JOIN character_books
  ON characters.id = character_books.character_id
  GROUP BY characters.name 
  ORDER BY number_of_books desc, characters.name"
end
