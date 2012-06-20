working_directory "/home/riak/apps/erlriak"
pid "/home/riak/apps/erlriak/tmp/riak.pid"
stderr_path "/home/riak/apps/erlriak/tmp/unicorn.log"
stdout_path "/home/riak/apps/erlriak/tmp/unicorn.log"

listen "/tmp/unicorn.riak.kickr.sock"
worker_processes 2
timeout 30

#bundle exec unicorn -c config/unicorn.rb -D
#bundle exec unicorn_rails -c config/unicorn.rb -E production -D