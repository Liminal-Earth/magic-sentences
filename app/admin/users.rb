ActiveAdmin.register User do
  actions :all, except: [:destroy]
  batch_action :destroy, false
  config.sort_order = "created_at_desc"
  config.per_page = 100

  index do
    column 'Edit' do |u|
      link_to 'Edit', edit_admin_user_path(u), title: "Edit"
    end
    column 'Name', sortable: :name do |u|
      link_to u.name, admin_user_path(u), class: "strong"
    end
    column 'Email', sortable: :email do |u|
      u.email
    end
    column 'Magic Sentence' do |u|
      link_to u.last_sentence.sentence, admin_sentence_path(u.last_sentence)
    end
    column 'Text Synth' do |u|
      u.last_sentence.last_text_synth.try(:text)
    end

    column '(edit)' do |u|
      unless u.last_sentence.last_text_synth.blank?
        link_to "edit text synth", admin_text_synth_path(u.last_sentence.last_text_synth)
      end
    end
  end


  csv do
    column "Name" do |user|
      user.name
    end
    column "Sentence" do |user|
      user.last_sentence.sentence
    end
    column "Text Synth" do |user|
      user.last_sentence.last_text_synth.text
    end
  end
end
