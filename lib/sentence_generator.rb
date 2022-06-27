class SentenceGenerator

  def initialize
    # Right now there is only one book, so...
    @book = Book.find(1)
  end

  def call
    sentence = []
    (0...6).each do
      page = Page.where(book: @book).order(Arel.sql('RANDOM()')).first
      sentence << page.words.sample.word
    end
    sentence.join(" ")
  end
end
