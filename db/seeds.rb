puts "Starting the database seeding process..."

# Clear existing data
puts "Destroying existing data..."
UserQuestion.destroy_all
Question.destroy_all
User.destroy_all
puts "Existing data cleared."

# Ensure the questions already exist in the database
questions = [
  { content: "What is your name?" },
  { content: "How old are you?" },
  { content: "Tell us about yourself. (detailed)" },
  { content: "What type of humor do you enjoy?" },
  { content: "What are your hobbies?" }
]

# Create questions if they do not exist
questions.each do |q|
  Question.find_or_create_by(content: q[:content])
end
puts "Questions created or verified."

# Create Users
puts "Seeding users..."
user1 = User.find_or_create_by(email: 'user1@example.com') do |user|
  user.password = 'password123'
end
user2 = User.find_or_create_by(email: 'user2@example.com') do |user|
  user.password = 'password123'
end
puts "Users created: #{user1.email}, #{user2.email}"

# Associate answers with users
puts "Seeding user answers..."
UserQuestion.create(user: user1, question: Question.find_by(content: "What is your name?"), answer: 'Alice')
UserQuestion.create(user: user1, question: Question.find_by(content: "How old are you?"), answer: '25')
UserQuestion.create(user: user1, question: Question.find_by(content: "Tell us about yourself. (detailed)"), answer: 'I am a software developer from California.')
UserQuestion.create(user: user1, question: Question.find_by(content: "What type of humor do you enjoy?"), answer: 'I enjoy dry humor.')
UserQuestion.create(user: user1, question: Question.find_by(content: "What are your hobbies?"), answer: 'I enjoy hiking and reading.')
puts "Answers created for user1."

UserQuestion.create(user: user2, question: Question.find_by(content: "What is your name?"), answer: 'Bob')
UserQuestion.create(user: user2, question: Question.find_by(content: "How old are you?"), answer: '30')
UserQuestion.create(user: user2, question: Question.find_by(content: "Tell us about yourself. (detailed)"), answer: 'I am a data analyst from New York.')
UserQuestion.create(user: user2, question: Question.find_by(content: "What type of humor do you enjoy?"), answer: 'I like slapstick humor.')
UserQuestion.create(user: user2, question: Question.find_by(content: "What are your hobbies?"), answer: 'I love cooking and playing chess.')
puts "Answers created for user2."

puts "Database seeding complete!"
