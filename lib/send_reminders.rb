require 'rubygems'
require 'mysql'
require 'yaml'

ENV['RAILS_ENV'] ||= "development"

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

reminders = con.query("SELECT remind_at, event_id from reminders")

reminders.each {|r| puts r}

