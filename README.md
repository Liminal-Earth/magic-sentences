# README Magic Sentences

# What the heck is this?

This is a little ruby on rails app for generating 'magic sentences' using words from books.
It includes a couple of scripts and tools for generating the sentences and also uses the
API at textsynth.com to generate predictive text paragraphs. You can use this for
entertaining 'divination'.

We like to do this the old fashioned way with dice and actual books pulled from
the shelves. But when you've got a ton of patreon patrons, automating it is the way
to go! The tools may be useful for others though so we've made this available for
you to fork and extend.


# What is included

Under usr/local you should find some scripts.

After downloading the code, running bundle install, and migrating the database you'll want to
run some of the scripts to get a functioning database.

`usr/local/import_pdf` - Will take a pdf, make a Book object, make a Page record for each page in the book,
and also all the words for that page. We've only tested this with a pdf copy of The Greaty Gatsby so far.

`usr/local/import_users` - this will take a script that contains usernames and email addresses so you can
generate magic sentences for individuals

`usr/local/generate_sentences` - this will attempt to generate a magic sentence by randomly picking a page
from the book and then randomly picking a word from that page. Right now it is just six words, perhaps
we can make that configurable, I dunno. If you like the sentence, it gets attached to the user.

`usr/local/generate_text_synth` - this will use the current magic sentence for each user and pass it over
to textsynth.com who will use predictive text in order to generate a further 'clarifying' paragraph for you.
You will need to get an API key to use this functionality, which is a paid service.

You can use the libs TextSynthGenerator and SentenceGenerator independently to make sentences.

There is an admin interface here: localhost:3000/admin when you boot up the server `bin/rails s`
You will be able to see and edit the magic sentences for users there.
