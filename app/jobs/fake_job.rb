class FakeJob < ApplicationJob
  queue_as :default


  # never change the name of the below funtion it has to be "perform"

  # def perform(*args)
  #   # Do something later
  #   puts "start the fake job"
  #   sleep 4
  #   puts "done"

  #   # this perform funtion is the job you want to enqueue: calling an API, Send an email, clean db , etc
  # end

  def perform(user_id)
    user = User.find(user_id)
    puts "This is the user ID #{user_id}--"
    puts "Calling Clearbit API for #{user.email}..."
    sleep 2
    puts "Done! Enriched #{user.email} with Clearbit"
  end
end


# test the newly created jb by running in the console FakeJob.perform_now
#  perform_now is given by Active Job and is synchronously becuase it runs when we call it.

# to run it asynchronously we use Sidekiq as the job scheduler (Active Job+ sidekiq). We could also use Queue Adapters (Active Job+ Queue Adapters)

# (ActiveJob jobs inherit from ApplicationJob  but one can also use Sidekiq directly by defining a class an include:
  # include Sidekiq::Worker
  # Sidekiq_options queue: "default")

