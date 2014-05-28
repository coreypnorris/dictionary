require 'pry'

class Term

  @@all_terms = []
  @index = 1

  attr_reader :words, :definitions, :id

  def Term.clear
    @@all_terms = []
    @index = 1
  end

  def Term.create
    new_term = Term.new(@index)
    @@all_terms << new_term
    @index += 1
    new_term
  end

  def Term.all
    @@all_terms
  end

  def initialize(index)
    @words = []
    @definitions = []
    @term_id = index
  end

  def add_word(word_to_add,language)
    new_word = Word.create(word_to_add,language)
    new_word.set_term(self)
    @words << new_word
  end

  def add_definition(definition_to_add, language)
    new_definition = Definition.create(definition_to_add,language)
    new_definition.set_term(self)
    @definitions << new_definition
  end

  def search_for_word(search_word)
    index_of_search_word = words.find_index { |obj| obj.word == search_word }
    words[index_of_search_word]
  end

  def remove_word(word_to_delete)
    word_to_remove = self.search_for_word(word_to_delete)
    self.words.delete(word_to_remove)
  end

end


