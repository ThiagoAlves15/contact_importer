class HardJob
  include Sidekiq::Job

  def perform(*args)
    puts "args: #{args}"
  end
end
