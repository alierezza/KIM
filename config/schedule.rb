
set :output, "log/cron_log.log"

every :sunday, :at => "6AM" do
  runner "User.weekly"
end

every '0 2 1 * *' do
	runner "User.monthly"
end
