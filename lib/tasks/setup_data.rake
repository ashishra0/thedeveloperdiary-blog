namespace :setup_data do

  desc "Setup Users"
  task setup_users: :environment do
    10.times do
      user = User.new(name: Faker::Book.author)
      user.email = user.name.split(' ').each {|n| n.downcase }.join('.') + '@' + ['gmail', 'yahoo', 'live'].shuffle.first + '.com'
      user.password = 'abcd1234'
      user.save
    end
  end

  desc "Setup Categories"
  task setup_categories: :environment do
    10.times do
      begin
        category = Category.new(name: Faker::Book.genre)
        category.save
      rescue ActiveRecord::RecordInvalid => e
        retry
      end
    end
  end

  desc "Setup Articles"
  task setup_articles: :environment do
    Category.all.each do |category|
      10.times do
        article = category.articles.build(
        title: Faker::Book.title,
        publish_date: (1..60).to_a.shuffle.first.month.ago,
        user_id: User.pluck(:id).shuffle.first,
        body: Faker::Lorem.paragraphs((10..50).to_a.shuffle.first).join(),
        image_url: Faker::LoremPixel.image("800x250")
        )
        article.save
      end
    end
  end
end
