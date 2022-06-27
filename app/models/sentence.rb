class Sentence < ApplicationRecord
  belongs_to :user
  has_many :text_synths

  def last_text_synth
    text_synths.order("created_at ASC").last
  end
end
