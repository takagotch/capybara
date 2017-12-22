require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergist'
require 'capybara/poltergist'
require 'robotex'

Capybara.configure do |config|
	config.run_server = false
	config.current_driver = :poltergist
	config.javascript_driver = :poltergist
	config.app_host = "http://www.yahoo.co.jp"
	config.default_wait_time = 5
	config.automatic_reload = false
end

Capybara.resister_driver :poltergist do |app|
	Capybara:Poltergist::Driver.new(app, {
	:timeout=>120, js_errors: false})
end

module Crawler
	class LinkChecker
		include Capybara::DSL

		def initialize()
			visit('')
			@robots = Robotex.new("Poltergist")
		end

		def find_links
			@link = []
			all('a').each do |a|
				u = a[:href]
				next if u.nil? or u.empty?
				@links << u
			end
			@links.uniq?
			@links
		end

		def alowed?(link)
			@robots.allowed(link)
		rescue
			false
		end

		def screenshot(link)
			puts link
			visit(link)
			page.save_screenshot("screenshot.png")
		end
	end
end

crawler = Crawler::LinkChecker.new
links = crawler.find_links
links.each {|link|
  if crawler.allowed?(link) then
	  crawler.screenshot(link)
  end
}
