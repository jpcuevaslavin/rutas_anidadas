Category.destroy_all
categories = []
%w[Action Drama Romance Thriller Anime Comedy Sci-Fi].each do |category|
  categories << Category.create(name: category)
end

Movies.destroy_all
100.times do
  Movie.create(
    title: Faker::Book.title, 
    year: rand(1950..2019), 
    category: categories.sample
    )
end
