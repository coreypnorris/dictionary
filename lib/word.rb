class Word
  attr_reader :word, :language, :term, :word_id

  @word_index = 1

  def Word.create(word,language)
    new_word = Word.new(word,language, @word_index)
    @word_index += 1
    new_word
  end

  def initialize(word, language, word_index)
    @word = word
    @language = language
    @word_id = word_index
  end

  def set_term(term_instance)
    @term = term_instance
  end

  def delete
    p word_to_delete  = Term.search(@word)
  end

end

