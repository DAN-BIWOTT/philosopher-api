20.times do
    Article.create({
        title: Faker::GreekPhilosophers.name,
        body: Faker::GreekPhilosophers.quote
    })
end