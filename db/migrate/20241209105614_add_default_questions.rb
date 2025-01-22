class AddDefaultQuestions < ActiveRecord::Migration[7.2]
  def change
    Question.create([
      { content: "What is your name?" },
      { content: "How old are you?" },
      { content:  "Tell us about yourself.(detailed)" },
      { content:  "What type of humor do you enjoy?"},
      { content: "What are your hobbies?" }
    ])
  end
end
