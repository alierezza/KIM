
set :output, "log/cron_log.log"

every :monday, :at => "1AM" do
  runner "User.weekly" #log weekly
end

every '0 1 1 * *' do
	runner "User.monthly" #log monthly,
end

every 1.day, :at => "1AM" do
	runner "User.daily" #email notifikasi
end
