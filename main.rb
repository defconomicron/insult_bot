$LOAD_PATH << File.expand_path(File.dirname(__FILE__))

load "insult.rb"
load "irc.rb"

# The main program
# If we get an exception, then print it out and keep going (we do NOT want
# to disconnect unexpectedly!)
irc = IRC.new('irc.freenode.net', 6667, 'InsultBot', '#insult_bot')
irc.connect()
begin
  irc.main_loop()
rescue Interrupt
rescue Exception => detail
  puts detail.message()
  print detail.backtrace.join("\n")
  retry
end
