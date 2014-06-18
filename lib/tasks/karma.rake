require 'open3'

namespace :test do

  desc 'Run all javascript tests with Karma'
  task :karma => :environment do
    # Use capybara to boot up a rails server for us,
    # and configure sprockets to serve javascripts from the spec directory

    Rails.application.assets.append_path Rails.root.join('spec', 'javascripts')
    server = Capybara::Server.new(Rails.application).boot
    puts "Booted Rails test server on port #{server.port}"

    Dir.mktmpdir do |dir|

      # Generate a temp karma configuration file from our template in config/karma.coffee.erb.
      # We're just doing this to stick the server port in, but could add a dynamic list of files too:
      view = ActionView::Base.new(Rails.root.join('config'))
      view.assign(port: server.port)

      karma_conf = File.join(dir, "karma.coffee")
      File.open(karma_conf, 'w') { |file| file.write view.render(template: 'karma.coffee.erb') }

      puts "Running karma with configuration file #{karma_conf}"
      Open3.popen2e("karma start #{karma_conf} --single-run") do |stdin, stdout_and_stderr, wait_thr|
        puts stdout_and_stderr.gets(nil)
        raise 'Karma tests failed' unless wait_thr.value.success?
      end

    end
  end

end
