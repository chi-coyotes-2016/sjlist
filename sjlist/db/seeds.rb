10.times { Category.find_or_create_by(name: Faker::Pokemon.name, description: Faker::StarWars.quote)}
150.times { Post.find_or_create_by(title: Faker::Space.nebula, body: Faker::Hipster.paragraph, author_id: (1 + rand(User.count - 1)), category_id: (1 + rand(Category.count - 1)))}
