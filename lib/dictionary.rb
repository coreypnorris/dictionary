require 'pry'

class Term

  @@all_terms = []
  @index = 1

  attr_reader :word, :definition, :id

  def Term.clear
    @@all_terms = []
    @index = 1
  end

  def Term.create(word, definition)
    new_term = Term.new(word, definition, @index)
    @@all_terms << new_term
    @index += 1
    new_term
  end

  def Term.all
    @@all_terms
  end

  def initialize(word, definition, index)
    @word = word
    @definition = definition
    @id = index
  end

  def remove
    Term.all.delete(self)
  end

  def edit_term_word(word)
    @word = word
  end

  def edit_term_definition(definition)
    @definition = definition
  end

  def Term.search(search_word)
    index_of_search_word = Term.all.find_index { |term| term.word == search_word }
    Term.all[index_of_search_word]
  end

end

first_term = Term.create('hello', 'sweetie')
second_term = Term.create('howdy', 'partner')
third_term = Term.create('what', 'what what')
