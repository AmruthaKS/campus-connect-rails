namespace :db do
  desc "Fill database with sample data"
  task :populate_comments => :environment do
    microposts = User.first.microposts.all(:limit => 100)
       content = Faker::Lorem.sentence(5)
       microposts.each { |micropost| micropost.comments.create!(:content => content, :user_id => 2) }
  end
end
