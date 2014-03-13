class Definition

  attr_reader :definition, :language

  def initialize(definition, language)
    @definition = definition
    @language = language
  end

  def Definition.create(definition, language)
    new_definition = Definition.new(definition, language)
  end

  def set_term(term_instance)
    @term = term_instance
  end

  def delete
    self.term.definitions.delete(self)
  end
end
