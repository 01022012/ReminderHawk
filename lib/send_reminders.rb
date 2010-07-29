require 'rubygems'
require 'mysql'
require 'yaml'
require 'net/http'
require 'uri'
require 'cgi'

ENV['RAILS_ENV'] ||= "production"

yml = YAML.load_file File.join(File.dirname(__FILE__), '../config/' 'database.yml')

db_config = yml[ENV['RAILS_ENV']]

db_config.each_pair {|key, value|
  puts "#{key}: #{value}"
}

begin
  con = Mysql.real_connect('localhost', 
                           db_config['username'], 
                           db_config['password'], 
                           db_config['database']) 
rescue Mysql::Error => e
  puts "Error code: #{e.errno}"
  puts "Error message: #{e.error}"
  puts "Error SQLSTATE: #{e.sqlstate}" if e.respond_to?("sqlstate")
end

reminders = con.query("SELECT id, event_id, remind_at  FROM `reminders` WHERE (remind_at < '#{Time.now}' and sent is false)")

reminders.each do |r|
  puts "#{r[0]} - #{r[1]} - #{r[2]}"
  event = con.query("SELECT id, subject from `events` WHERE (`events`.`id` = #{r[1]})").fetch_row
  message = event[1]

  puts message

  phone_number_set = con.query("SELECT number FROM `phone_numbers` WHERE (`phone_numbers`.event_id = #{event[0]})")

  phone_numbers = []
  
  phone_number_set.each {|p| phone_numbers << p[0]}

  puts phone_numbers

  # Time to send the reminder
  Net::HTTP.get_print URI.parse("http://bulksms.gateway4sms.com/pushsms.php?username=reminderhawk&password=790188&to=#{phone_numbers.join(',')}&message=#{CGI::escape(message)}")

  # Mark as sent
  con.query("UPDATE `reminders` SET `updated_at` = '#{Time.now}', `sent` = 1 WHERE `id` = #{r[0]}")
  
end

