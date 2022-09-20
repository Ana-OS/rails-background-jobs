namespace :user do
  desc "Enrich all users with Clearbit (async)"
  task update_users: :environment do
    users = User.all
    puts "updating all #{users.size} users"
    users.each { |user| FakeJob.perform_later(user.id)}
  end

end
