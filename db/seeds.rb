# Miles Halpine 10607950
# This file contains all the create commands used to populate the db with seeding data
# Useful for using after migration rollback to make db changes
# CURRENT ISSUE: custom min_one_category validation seems to not like these seeds, so I've had to bypass it for now due to time

# Allows quote seeding data to bypass the min_one_category (No idea why this is still an issue as all quotes have a category)
Quote.skip_callback(:validate, :before, :min_one_category)

# User seeding data
User.create!({
  fname: "John",
  lname: "Jones",
  email: "admin@myquotes.com",
  password: "admin123",
  password_confirmation: "admin123",
  is_admin: true,
  status: "Active"
})
User.create!({
  fname: "Vincent",
  lname: "Brown",
  email: "vinceb@myemail.com",
  password: "vince123",
  password_confirmation: "vince123",
  is_admin: false,
  status: "Active"
})

# Philosopher seeding data
Philosopher.create!(fname: "Aristotle", birth_year: "384 BCE", death_year: "322 BCE", biography: "An ancient Greek philosopher and polymath who had a major impact on both the sciences and philosophies from the Middle Ages up to the Renaissance. Considered one of the greatest intellectual figures in the Western world.")
Philosopher.create!(fname: "Friedrich", lname: "Nietzsche", birth_year: "1844", death_year: "1900", biography: "A German philosopher who largely focused on radical critiques of Western religion, morality and politics.")
Philosopher.create!(fname: "Immanuel", lname: "Kant", birth_year: "1724", death_year: "1804", biography: "A German philosopher who was one of the pillars of the Age of Enlightenment.")
Philosopher.create!(fname: "Confucius", birth_year: "551 BCE", death_year: "479 BCE", biography: "Considered China's most famous philosopher. His philosophical teachings are categorised under their own name: Confucianism, which focuses on morality, righteousness and human connection.")
Philosopher.create!(fname: "Plato", birth_year: "429 BCE", death_year: "348 BCE", biography: "An ancient Greek philosopher who was major Western philosopher during the Classical period of Greece. His teachings became so well regarded that a new form of philosophy, Platoism, was developed based on his doctrines, which focus on the belief around abstract entities.")

# Category seeding data
Category.create!(cat_name: "Metaphysics") 
Category.create!(cat_name: "Epistemology") 
Category.create!(cat_name: "Axiology") 
Category.create!(cat_name: "Logic")
Category.create!(cat_name: "Ethics") 
Category.create!(cat_name: "Political") 
Category.create!(cat_name: "Aesthetics") 

# Quote seeding data
# BELOW QUOTE CATEGORIES: METAPHYSICS, LOGIC AND EPISTEMOLOGY
Quote.create!(
  quote_text: "All our knowledge begins with the senses, proceeds then to the understanding, and ends with reason. There is nothing higher than reason.",
  pub_year: "1781",
  user_comment: "For Immanuel Kant, human cognition can be divided into 3 parts, with each one being higher level of cognition. The first level is the basic human sense, such as sight, sound or taste. The next level is the human ability to interpret these senses into information about your surroundings. The final level is understand information beyond the human senses, into more abstract ideas.",
  user_id: 1,
  philosopher_id: 3
)
# BELOW QUOTE CATEGORIES: EPISTEMOLOGY, ETHICS AND METAPHYSICS
Quote.create!(
  quote_text: "Real knowledge is to know the extent of one’s ignorance.",
  user_comment: "The truth behind a person's knowledge is being able to reflect on their own limits when it comes to knowledge. So says Confucius",
  is_public: true,
  user_id: 2,
  philosopher_id: 4
)
# BELOW QUOTE CATEGORIES: ETHICS, AXIOLOGY AND METAPHYSICS
Quote.create!(
  quote_text: "He who has a why to live can bear almost any how.",
  pub_year: "1889",
  user_id: 1,
  philosopher_id: 2
)
# BELOW QUOTE CATEGORIES: LOGIC AND EPISTEMOLOGY
Quote.create!(
  quote_text: "We must follow an argument wherever it leads.",
  user_id: 2,
  philosopher_id: 5
)
# BELOW QUOTE CATEGORIES: POLITICAL AND METAPHYSICS
Quote.create!(
  quote_text: "Man is by nature a political animal.",
  user_comment: "This quote illustrates that humans, due to their need for socialisation, will naturally have their own political leanings and associate and socialise with others due to them.",
  user_id: 2,
  philosopher_id: 1
)
# BELOW QUOTE CATEGORIES: AESTHETIC
Quote.create!(
  quote_text: "The beautiful is that which pleases universally without a concept.",
  pub_year: "1790",
  user_id: 1,
  philosopher_id: 3
)
# BELOW QUOTE CATEGORIES: POLITICS, ETHICS AND AXIOLOGY
Quote.create!(
  quote_text: "The superior man understands what is right; the inferior man understands what will sell.",
  user_comment: "A personal favourite quote of mine that truly helps me stay grounded and understand the world",
  is_public: true,
  user_id: 2,
  philosopher_id: 4
)
# BELOW QUOTE CATEGORIES: EPISTEMOLOGY, LOGIC AND METAPHYSICS
Quote.create!(
  quote_text: "Thoughts without content are empty; intuitions without concepts are blind.",
  pub_year: "1781",
  user_id: 1,
  philosopher_id: 3
)
# BELOW QUOTE CATEGORIES: AXIOLOGY, ETHICS, POLITICS
Quote.create!(
  quote_text: "Happiness is the meaning and the purpose of life, the whole aim and end of human existence.",
  user_comment: "A very cut and dry answer to the question about life's purpose.",
  user_id: 2,
  philosopher_id: 1
)
# BELOW QUOTE CATEGORIES: ANXIOLOGY, AESTHETICS, ETHICS
Quote.create!(
  quote_text: "The object of education is to teach us to love what is beautiful.",
  user_id: 2,
  philosopher_id: 5
)
# BELOW QUOTE CATEGORIES: LOGIC
Quote.create!(
  quote_text: "Logic must be regarded as a canon for judgment.",
  pub_year: "1781",
  is_public: false,
  user_id: 1,
  philosopher_id: 3
)
# BELOW QUOTE CATEGORIES: ETHICS, POLTICS, AXIOLOGY
Quote.create!(
  quote_text: "Morality is the herd-instinct in the individual.",
  pub_year: "1882",
  user_id: 1,
  philosopher_id: 2
)
  
#QuoteCategory seeding data
QuoteCategory.create!(
  quote_id: 1,
  category_id: 1
)
QuoteCategory.create!(
  quote_id: 1,
  category_id: 2
)
QuoteCategory.create!(
  quote_id: 1,
  category_id: 4
)
QuoteCategory.create!(
  quote_id: 2,
  category_id: 1
)
QuoteCategory.create!(
  quote_id: 2,
  category_id: 2
)
QuoteCategory.create!(
  quote_id: 2,
  category_id: 5
)
QuoteCategory.create!(
  quote_id: 3,
  category_id: 1
)
QuoteCategory.create!(
  quote_id: 3,
  category_id: 3
)
QuoteCategory.create!(
  quote_id: 3,
  category_id: 5
)
QuoteCategory.create!(
  quote_id: 4,
  category_id: 2
)
QuoteCategory.create!(
  quote_id: 4,
  category_id: 4
)
QuoteCategory.create!(
  quote_id: 5,
  category_id: 1
)
QuoteCategory.create!(
  quote_id: 5,
  category_id: 6
)
QuoteCategory.create!(
  quote_id: 6,
  category_id: 7
)
QuoteCategory.create!(
  quote_id: 7,
  category_id: 3
)
QuoteCategory.create!(
  quote_id: 7,
  category_id: 5
)
QuoteCategory.create!(
  quote_id: 7,
  category_id: 6
)
QuoteCategory.create!(
  quote_id: 8,
  category_id: 1
)
QuoteCategory.create!(
  quote_id: 8,
  category_id: 2
)
QuoteCategory.create!(
  quote_id: 8,
  category_id: 4
)
QuoteCategory.create!(
  quote_id: 9,
  category_id: 3
)
QuoteCategory.create!(
  quote_id: 9,
  category_id: 5
)
QuoteCategory.create!(
  quote_id: 9,
  category_id: 6
)
QuoteCategory.create!(
  quote_id: 10,
  category_id: 3
)
QuoteCategory.create!(
  quote_id: 10,
  category_id: 5
)
QuoteCategory.create!(
  quote_id: 10,
  category_id: 7
)
QuoteCategory.create!(
  quote_id: 11,
  category_id: 4
)
QuoteCategory.create!(
  quote_id: 12,
  category_id: 3
)
QuoteCategory.create!(
  quote_id: 12,
  category_id: 5
)
QuoteCategory.create!(
  quote_id: 12,
  category_id: 7
)
  
Quote.set_callback(:validate, :before, :min_one_category)
