class WordGenerator

  def initialize(id: 1)
    # Right now there is only one book, so...
    @book = Book.find(id)
    @tgr = EngTagger.new
  end

  def call
    valid = false

    until valid
      page = Page.where(book: @book).order(Arel.sql('RANDOM()')).first
      word = page.words.sample.try(:word)
      next unless word.present?

      tagged = @tgr.add_tags(word)
      noun = @tgr.get_nouns(tagged)
      next unless noun.keys.first.present?

      word = noun.keys.first
      valid = true
    end
    word
  end
end
