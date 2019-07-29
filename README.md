CoopAssistantBot 🤖
===================

CoopAssistantBot is a chatbot prototype built as part of the Faberchool about chatbots, for the last session. The other session can be found [here](https://github.com/lcrepet/Faberschool-Chatbots).

There is a new food coop in town! And they want a chatbot on their Facebook page. This chatbot will answer to the questions about the coop (address, opening...) and allow members to manage their shifts.

(If you don't know what a "food coop" is, you can check on [Wikipedia](https://en.wikipedia.org/wiki/Food_cooperative).)


Usage
-----
Once you have cloned the project, do the usual stuffs:
``bundle install
bundle exec db:create
bundle exec db:migrate``

Setup your [Messenger
app](https://developers.facebook.com/docs/messenger-platform/getting-started/app-setup)
and your [SAP CAI chatbot](https://cai.tools.sap/) (see [Session
3](https://github.com/lcrepet/Faberschool-Chatbots/tree/master/session_3)).
Copy ``.env_dist`` to ``.env``, set the matching settings.

Execute:
``bundle exec rails server``

Your chatbot is alive! \o/


Levels
------
This is a hands-on exercise with 4 levels. You can find a solution for each
one of them on the branch ``solution`` at the corresponding tag.
* first_level: sometimes your chatbot doesn't understand or cannot answer, or
  the user doesn't know how to talk to the chatbot; in this case, the chatbot should
  send a message like: "I'm not sure I understand, you can reach a humain being
  at: 06 00 00 00 00."
* second_level: it's nice when a chatbot can do small talk! Fortunately, SAP
  CAI has built-in responses for greetings, good bye or "asking for a joke"
  message.
* third_level: one of the main goals of this chatbot is to answer to people's
  questions. The food coop provides you its FAQ through Coop API; you can use
  the lib Coop to query it.
  Another way is to use the model Question and store the questions and the
  answers in the database (table: questions). Admin users can add/delete/change
  questions on the ActiveAdmin interface.
* fourth_level: the members can ask the chatbot about their schedules. For
  that, the chatbot needs to know to which member it talks! The Coop API allows
  you to log the members via OAuth and manage their account.

TODO:
* fifth_level: schedule new shift through the chatbot. Use the scenarios (the
exchange between the members and the chatbot could be composed by more than
2 messages and the chatbot could need memory) and the Coop API.


Requirements
------------
* ruby >= 2.4
* Rails >= 5.1
* postgresql

